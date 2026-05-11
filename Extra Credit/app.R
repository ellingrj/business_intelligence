# Streaming Platform Ads Explorer
# A Shiny app for exploring how streaming services utilize ads
# Built with querychat for natural language data querying

library(shiny)

# ---------------------------------------------------------------------------
# Data & QueryChat setup
# ---------------------------------------------------------------------------

oews <- as.data.frame(readRDS("streaming_ads.rds"))

# Pre-compute static stats for the Home tab
n_platforms <- length(unique(oews$Platform))
n_spend       <- sum(as.numeric(oews$`2025 Ad Spending (Millions)`), na.rm = TRUE)
data_period   <- "2020-2025"

client <- ellmer::chat_openai(
  model = "gpt-5-mini-2025-08-07",
  credentials = function() { return(Sys.getenv("OPENAI_API_KEY")) }
)

qc <- querychat::querychat(
  oews,
  client = client,
  greeting = "Welcome to Our ISA 401 Assistant for Understanding Streaming Services and Their Ads",
  extra_instructions = "data/extra_instructions.md",
  data_description = "data/data_desc.md"
)

# ---------------------------------------------------------------------------
# UI
# ---------------------------------------------------------------------------

ui <- bslib::page_navbar(
  id = "navbar",
  title = "Streaming Ads Explorer",
  theme = bslib::bs_theme(primary = "#C3142D"),
  navbar_options = bslib::navbar_options(bg = "#C3142D"),
  fillable = "Explorer",

  sidebar = bslib::sidebar(
    id = "sidebar",
    width = 325,
    shiny::conditionalPanel(
      "input.navbar == 'Explorer'",
      qc$ui()
    ),
    shiny::conditionalPanel(
      "input.navbar == 'Home'",
      tags$div(
        class = "p-2",
        tags$h5("Welcome!"),
        tags$p("Use the tabs above to explore the data. The ",
               tags$strong("Explorer"), " tab lets you query the streaming dataset
               using natural language."),
        tags$hr(),
        tags$p("Try asking things like:"),
        tags$ul(
          tags$li("Show me the platform with the highest revenue."),
          tags$li("Filter to include only platforms with pre-roll ads."),
          tags$li("What are the 5 platforms with the higest ad spend?")
        )
      )
    ),
    fillable = TRUE
  ),

  # ---------- Home Tab ----------
  bslib::nav_panel(
    title = "Home",
    value = "Home",
    icon = bsicons::bs_icon("house"),

    # Hero card
    bslib::card(
      class = "bg-dark text-white border-0",
      style = "background: linear-gradient(135deg, #C3142D 0%, #8B0E20 100%);",
      bslib::card_body(
        class = "text-center py-5",
        tags$h1("Streaming Ads Explorer", class = "display-4 fw-bold"),
        tags$p(
          class = "lead mt-3 mb-4",
          "Explore Streaming Services and their Ads using natural language queries powered by AI"
        ),
        tags$p(class = "text-white-50 mb-4", "A Business Intelligence and Data Visualization Assignment for ISA 401 at Miami University"),
        shiny::actionButton(
          "go_explorer", "Start Exploring",
          class = "btn btn-outline-light btn-lg px-4",
          icon = shiny::icon("magnifying-glass")
        )
      )
    ),

    # App metadata row
    bslib::layout_column_wrap(
      width = 1 / 4,
      fill = FALSE,
      bslib::value_box(
        title = "Version",
        value = "0.1.0",
        showcase = bsicons::bs_icon("tag"),
        theme = "light"
      ),
      bslib::value_box(
        title = "Last Updated",
        value = "Feb 2026",
        showcase = bsicons::bs_icon("calendar-check"),
        theme = "light"
      ),
      bslib::value_box(
        title = "By",
        value = tags$span("Rylee Elling", style = "font-size: 1em;"),
        p("Miami University"),
        showcase = bsicons::bs_icon("person"),
        theme = "light"
      ),
      bslib::value_box(
        title = "Data Period",
        value = data_period,
        p(format(n_spend, big.mark = ","), " million spent on ads in 2025 \u00B7 ",
          format(n_platforms, big.mark = ","), " streaming platforms"),
        showcase = bsicons::bs_icon("bar-chart-line"),
        theme = "light"
      )
    ),

    # Developer / About + Tutorial row
    bslib::layout_columns(
      col_widths = c(6, 6),
      fill = FALSE,

      bslib::card(
        bslib::card_header(class = "fw-bold", bsicons::bs_icon("info-circle"), " About"),
        bslib::card_body(
          tags$p(
            "This app uses the ",
            tags$a("querychat", href = "https://posit-dev.github.io/querychat/",
                   target = "_blank"),
            " R package to let you query the ",
            tags$strong("Streaming Service Ads"),
            " dataset created by ",
            tags$a("ISA401 Spring 2026 Group 5",
                   href = "https://github.com/ellingrj/ISA401-Final-Project", target = "_blank"),
            " using plain English. Under the hood, your questions are translated
            to SQL by an OpenAI language model."
          ),
          tags$hr(),
          tags$h6(class = "fw-bold mb-2", "Developer"),
          tags$div(
            class = "d-flex align-items-start gap-3",
            bsicons::bs_icon("person-circle", size = "2em"),
            tags$div(
              tags$div(class = "fw-semibold", "Rylee Elling"),
              tags$small(class = "text-muted d-block",
                         "Business Analytics Student, Farmer School of Business"),
              tags$small(class = "text-muted d-block mb-2", "Miami University"),
              tags$div(
                class = "d-flex flex-wrap gap-2",
                tags$a(class = "btn btn-outline-secondary btn-sm",
                       href = "mailto:ellingrj@miamioh.edu",
                       bsicons::bs_icon("envelope"), " Email"),
                tags$a(class = "btn btn-outline-secondary btn-sm",
                       href = "https://www.linkedin.com/in/rylee-elling/",
                       target = "_blank",
                       bsicons::bs_icon("linkedin"), " LinkedIn"),
                tags$a(class = "btn btn-outline-secondary btn-sm",
                       href = "https://programs.miamioh.edu/programs/business-analytics-ms/",
                       target = "_blank",
                       bsicons::bs_icon("globe"), " Website"),
                tags$a(class = "btn btn-outline-secondary btn-sm",
                       href = "https://github.com/ellingrj",
                       target = "_blank",
                       shiny::icon("github"), " GitHub")
              )
            )
          ),
          tags$hr(),
          tags$h6(class = "fw-bold mb-2", "Data Source"),
          tags$div(
            class = "d-flex flex-wrap gap-2",
            tags$a(class = "btn btn-outline-primary btn-sm",
                   href = "https://github.com/ellingrj/ISA401-Final-Project", target = "_blank",
                   bsicons::bs_icon("table"), " GitHub"),
            tags$a(class = "btn btn-outline-primary btn-sm",
                   href = "https://github.com/ellingrj/ISA401-Final-Project/blob/main/Data/401_data.csv",
                   target = "_blank",
                   bsicons::bs_icon("download"), " Raw Data (CSV)")
          )
        )
      ),

      bslib::card(
        bslib::card_header(class = "fw-bold", bsicons::bs_icon("play-circle"), " Video Tutorial"),
        bslib::card_body(
          fillable = FALSE,
          tags$div(
            class = "ratio ratio-16x9",
            tags$iframe(
              src = "https://www.youtube.com/embed/dqYlfEocdSk",
              allowfullscreen = NA,
              allow = "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            )
          )
        )
      )
    )
  ),

  # ---------- Explorer Tab ----------
  bslib::nav_panel(
    title = "Explorer",
    value = "Explorer",
    icon = bsicons::bs_icon("search"),

    bslib::card(
      bslib::card_header(shiny::textOutput("explorer_table_title")),
      DT::DTOutput("table")
    ),

    bslib::accordion(
      open = FALSE,
      bslib::accordion_panel(
        title = "SQL Query",
        icon = bsicons::bs_icon("code-square"),
        shiny::verbatimTextOutput("sql")
      )
    )
  )
)

# ---------------------------------------------------------------------------
# Server
# ---------------------------------------------------------------------------

server <- function(input, output, session) {
  qc_vals <- qc$server()

  # Navigate to Explorer tab on button click
  shiny::observeEvent(input$go_explorer, {
    bslib::nav_select("navbar", "Explorer")
  })

  output$explorer_table_title <- shiny::renderText({
    qc_vals$title() %||% "Streaming Service Ads Data"
  })

  output$table <- DT::renderDT({
    DT::datatable(
      qc_vals$df(),
      fillContainer = TRUE,
      options = list(scrollX = TRUE, pageLength = 15)
    )
  })

  output$sql <- shiny::renderText({
    qc_vals$sql() %||% "SELECT * FROM listings"
  })
}

shiny::shinyApp(ui, server)
