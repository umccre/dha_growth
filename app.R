
library(shiny)
library(bslib)

# Direct GitHub MP4 links
video_1 <- "https://raw.githubusercontent.com/umccre/dha_growth/main/plot1_ipad.mp4"
video_2 <- "https://raw.githubusercontent.com/umccre/dha_growth/main/proto_piles_multi_ipad.mp4"

video_player <- function(url) {
  div(
    class = "video-container",
    tags$video(
      controls = NA,
      playsinline = NA,
      preload = "metadata",
      tags$source(src = url, type = "video/mp4")
    )
  )
}

ui <- page_navbar(
  title = "Delta Health Alliance",
  
  theme = bs_theme(
    version = 5,
    bg = "#167347",
    fg = "#FFFFFF"
  ),
  
  bg = "#06462C",
  inverse = TRUE,
  fillable = FALSE,
  
  header = tags$head(
    tags$style(HTML("
      body {
        background-color: #167347 !important;
      }

          .video-container {
        width: 100%;
        height: calc(100vh - 96px);
        height: calc(100dvh - 96px);
        margin: 12px auto;
        padding: 0 12px;
        display: flex;
        align-items: center;
        justify-content: center;
      }
      
      .video-container video {
        display: block;
        width: auto;
        height: 100%;
        max-width: 100%;
        object-fit: contain;
        background: transparent;
        border-radius: 12px;
      }
      /* Improved navigation menu */
      .navbar {
        background-color: #06462C !important;
      }

      .navbar .navbar-brand,
      .navbar .navbar-nav .nav-link,
      .navbar .navbar-nav .nav-link:hover,
      .navbar .navbar-nav .nav-link:focus {
        color: #FFFFFF !important;
        opacity: 1 !important;
      }

      /* Highlight selected tab */
      .navbar .navbar-nav .nav-link.active {
        color: #FFFFFF !important;
        background-color: #167347 !important;
        border-bottom: 3px solid #FFFFFF;
      }

      .navbar .navbar-toggler {
        border-color: rgba(255,255,255,.7) !important;
      }

      .navbar .navbar-toggler-icon {
        filter: brightness(0) invert(1);
      }
    "))
  ),
  
  nav_panel("Participants Ever Served", video_player(video_1)),
  nav_panel("External Funding Secured", video_player(video_2)),
  navbar_options = navbar_options(
    bg = "#06462C",
    theme = "dark",
    collapsible = FALSE
  )
)

server <- function(input, output, session) {}

shinyApp(ui, server)