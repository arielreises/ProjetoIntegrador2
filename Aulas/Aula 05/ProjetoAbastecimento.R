# Carregar pacotes necessários
library(shiny)
library(googlesheets4)
library(ggplot2)
library(dplyr)
library(lubridate)

# URL da planilha do Google Sheets
sheet_url <- "https://docs.google.com/spreadsheets/d/-censored-/edit"

# Função para carregar e processar os dados
carregar_dados <- function() {
  dados <- read_sheet(sheet_url)
  
  # Renomeando colunas para evitar problemas com espaços e pontuações
  dados <- dados %>%
    rename(
      Data = "Data do Abastecimento:",
      Odometro = "Quilometragem:",
      Percorrido = "Percorrido:",
      Valor = "Valor pago:",
      Litros = "Quantidade abastecida (litros):",
      Mes = "Mês"
    ) %>%
    mutate(
      Data = as.Date(Data, format = "%d/%m/%Y"),
      Odometro = as.numeric(Odometro),
      Percorrido = as.numeric(Percorrido),
      Valor = as.numeric(gsub("[^0-9,]", "", Valor)), # Remove "R$" e converte para número
      Litros = as.numeric(Litros),
      Mes = factor(Mes, levels = unique(Mes)) # Garante a ordem dos meses
    ) %>%
    filter(!is.na(Data)) # Remove linhas vazias
  
  return(dados)
}

# UI - Interface do usuário
ui <- fluidPage(
  titlePanel("Dashboard de Abastecimento"),
  
  sidebarLayout(
    sidebarPanel(
      actionButton("atualizar", "Atualizar Dados"),
      selectInput("mes_selecionado", "Selecione o Mês:", choices = NULL)
    ),
    
    mainPanel(
      h3("Resumo Mensal"),
      tableOutput("resumo"),
      
      h3("Média de Consumo (km/L)"),
      plotOutput("grafico_consumo"),
      
      h3("Gastos com Combustível"),
      plotOutput("grafico_gastos")
    )
  )
)

# SERVER - Lógica do aplicativo
server <- function(input, output, session) {
  # Reatividade para carregar os dados
  dados_react <- reactiveVal(carregar_dados())
  
  # Atualiza os dados quando o botão for pressionado
  observeEvent(input$atualizar, {
    dados_react(carregar_dados())
    updateSelectInput(session, "mes_selecionado", choices = unique(dados_react()$Mes))
  })
  
  # Atualiza os meses disponíveis no dropdown ao iniciar
  observe({
    updateSelectInput(session, "mes_selecionado", choices = unique(dados_react()$Mes))
  })
  
  # Filtra os dados pelo mês selecionado
  dados_filtrados <- reactive({
    req(input$mes_selecionado)
    dados_react() %>% filter(Mes == input$mes_selecionado)
  })
  
  # Tabela de resumo
  output$resumo <- renderTable({
    dados <- dados_filtrados()
    if (nrow(dados) == 0) return(NULL)
    
    resumo <- dados %>%
      summarise(
        Total_Abastecimentos = n(),
        Total_Km = sum(Percorrido, na.rm = TRUE),
        Total_Litros = sum(Litros, na.rm = TRUE),
        Media_Consumo = round(Total_Km / Total_Litros, 2),
        Gasto_Total = sum(Valor, na.rm = TRUE)
      )
    
    return(resumo)
  })
  
  # Gráfico de consumo médio (km/L)
  output$grafico_consumo <- renderPlot({
    dados <- dados_filtrados()
    if (nrow(dados) == 0) return(NULL)
    
    ggplot(dados, aes(x = Data, y = Percorrido / Litros)) +
      geom_line(color = "blue") +
      geom_point(color = "red") +
      labs(title = "Evolução do Consumo (km/L)", x = "Data", y = "km por litro") +
      theme_minimal()
  })
  
  # Gráfico de gastos com combustível
  output$grafico_gastos <- renderPlot({
    dados <- dados_filtrados()
    if (nrow(dados) == 0) return(NULL)
    
    ggplot(dados, aes(x = Data, y = Valor)) +
      geom_bar(stat = "identity", fill = "darkgreen") +
      labs(title = "Gastos com Combustível", x = "Data", y = "Valor (R$)") +
      theme_minimal()
  })
}

# Rodar app
shinyApp(ui = ui, server = server)
