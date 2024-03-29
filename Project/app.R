## Gayatri Balasubramanian
## GOV 1005 Final Project Shiny Web Application
## Distribution of Industries and Ethnicities in Indiana


## Load in the libraries we need

library(gt)
library(sf)
library(rgdal)
library(shiny)
library(vembedr)
library(janitor)
library(markdown)
library(tidyverse)
library(shinythemes)



## Define UI for application that draws a histogram

ui <- navbarPage(theme = shinytheme("superhero"),
                 
                 "Ethnicity-Industry-Indiana",
                 
                 
                 ## Plot Tab
                 ## Gets user input of which ethnicity and which industries to plot
                 ## Creates the plot
                 
                 tabPanel("Plot",
                          
                          fluidRow(
                              
                              ## On the left hand side of the page get user input
                              
                              column(2,
                                     
                                     ## This is a single select input for ethnicity  
                                     
                                     selectInput("radio", label = h3("Ethnic Descent"),
                                                 choices = list(
                                                     "armenia" = "armenia",
                                                     "assyria" = "assyria",
                                                     "australia" = "australia",
                                                     "austria" = "austria",
                                                     "basque" = "basque",
                                                     "belgium" = "belgium",
                                                     "brazil" = "brazil",
                                                     "bulgaria" = "bulgaria",
                                                     "canada" = "canada",
                                                     "capeverde" = "capeverde",
                                                     "carprus" = "carprus",
                                                     "celtic" = "celtic",
                                                     "croatia" = "croatia",
                                                     "cyprus" = "cyprus",
                                                     "czech" = "czech",
                                                     "czchslovk" = "czchslovk",
                                                     "denmark" = "denmark",
                                                     "eeurope" = "eeurope",
                                                     "egypt" = "egypt",
                                                     "english" = "english",
                                                     "estonia" = "estonia",
                                                     "ethiopia" = "ethiopia",
                                                     "europe" = "europe",
                                                     "finland" = "finland",
                                                     "france" = "france",
                                                     "frcanada" = "frcanada",
                                                     "germany" = "germany",
                                                     "ghana" = "ghana",
                                                     "grbritain" = "grbritain",
                                                     "greece" = "greece",
                                                     "guyana" = "guyana",
                                                     "hungary" = "hungary",
                                                     "iceland" = "iceland",
                                                     "iran" = "iran",
                                                     "iraq"= "iraq",
                                                     "ireland" = "ireland",
                                                     "israel" = "israel",
                                                     "italy" = "italy",
                                                     "jordan" = "jordan",
                                                     "kenya" = "kenya",
                                                     "latvia" = "latvia",
                                                     "lebanon" = "lebanon",
                                                     "liberia" = "liberia",
                                                     "lithuania" = "lithuania",
                                                     "luxemburg" = "luxemburg",
                                                     "macedonia" = "macedonia",
                                                     "malta" = "malta",
                                                     "morrocco" = "morrocco",
                                                     "netherlnd" = "netherlnd",
                                                     "neurope" = "neurope",
                                                     "newzeal" = "newzeal",
                                                     "nigeria" = "nigeria",
                                                     "norway" = "norway",
                                                     "ossafric" = "ossafric",
                                                     "otharab" = "otharab",
                                                     "palestine" = "palestine",
                                                     "poland" = "poland",
                                                     "portugal" = "portugal",
                                                     "romania" = "romania",
                                                     "russia" = "russia",
                                                     "safrica" = "safrica",
                                                     "saudi" = "saudi",
                                                     "scandnv" = "scandnv",
                                                     "scotirish" = "scotirish",
                                                     "scotland" = "scotland",
                                                     "senegal" = "senegal",
                                                     "serbia" = "serbia",
                                                     "sierrleon" = "sierrleon",
                                                     "slavic" = "slavic",
                                                     "slovak" = "slovak",
                                                     "slovenia" = "slovenia",
                                                     "somalia" = "somalia",
                                                     "sovunion" = "sovunion",
                                                     "subafrica" = "subafrica",
                                                     "sudan" = "sudan",
                                                     "sweden" = "sweden",
                                                     "switzrlnd" = "switzrlnd",
                                                     "syria" = "syria",
                                                     "turkey" = "turkey",
                                                     "uganda" = "uganda",
                                                     "ukraine" = "ukraine",
                                                     "wales" = "wales",
                                                     "westindes" = "westindes",
                                                     "yugoslavia" = "yugoslavia",
                                                     "zaire" = "zaire",
                                                     "zimbabwe" = "zimbabwe",
                                                     "white" = "white",
                                                     "hispanic" = "hispanic",
                                                     "black" = "black",
                                                     # "amindan" = "amindan",
                                                     "asian" = "asian" 
                                                 ),
                                                 
                                                 ## By default we have it set to white
                                                 
                                                 selected = "white"),
                                     
                                     
                                     ## This is a multiple select input for industries  
                                     
                                     selectInput("checkGroup", label = h3("Industry"), 
                                                 choices = list(
                                                     "Electric" = "Electric",
                                                     "Internet Services" = "Internet Services",
                                                     # "Sporting & Music Stores" = "Sporting & Music Stores",
                                                     # "Accommodation" = "Accommodation",
                                                     # "Accommodation and Food Services" = "Accommodation and Food Services",
                                                     # "Admin, Support, Waste" = "Admin, Support, Waste",
                                                     # "Agriculture, Forestry, Fishing and Hunting" = "Agriculture, Forestry, Fishing and Hunting",
                                                     # "Air Transportation" = "Air Transportation",
                                                     # "Ambulatory Health Care Services" = "Ambulatory Health Care Services",
                                                     # "Amusement, Gambling, and Recreation Industries" = "Amusement, Gambling, and Recreation Industries",
                                                     # "Animal Production" = "Animal Production",
                                                     "Apparel Manufacturing" = "Apparel Manufacturing",
                                                     # "Arts, Entertainment, and Recreation" = "Arts, Entertainment, and Recreation",
                                                     # "Beverage and Tobacco Product Mfg" = "Beverage and Tobacco Product Mfg",
                                                     # "Bldg. Mat. & Garden Equip. & Supp. Dealers" = "Bldg. Mat. & Garden Equip. & Supp. Dealers",
                                                     # "Broadcasting (except Internet)" = "Broadcasting (except Internet)",
                                                     "Chemical Manufacturing" = "Chemical Manufacturing",
                                                     # "Clothing and Clothing Accessories Stores" = "Clothing and Clothing Accessories Stores",
                                                     # "Computer and Electronic Product Mfg" = "Computer and Electronic Product Mfg",
                                                     # "Construction" = "Construction",
                                                     # "Construction of Buildings" = "Construction of Buildings",
                                                     # "Couriers and Messengers" = "Couriers and Messengers",
                                                     # "Credit Intermediation and Related Activities" = "Credit Intermediation and Related Activities",
                                                     # "Credit Intermediation and Related Activities" = "Credit Intermediation and Related Activities",
                                                     "Crop Production" = "Crop Production",
                                                     # "Educational Services" = "Educational Services",
                                                     # "Electronics and Appliance Stores" = "Electronics and Appliance Stores",
                                                     # "Fabricated Metal Product Mfg" = "Fabricated Metal Product Mfg",
                                                     # "Finance and Insurance" = "Finance and Insurance",
                                                     # "Fishing, Hunting and Trapping" = "Fishing, Hunting and Trapping",
                                                     # "Food and Beverage Stores" = "Food and Beverage Stores",
                                                     # "Food Manufacturing" = "Food Manufacturing",
                                                     # "Food Services and Drinking Places" = "Food Services and Drinking Places",
                                                     # "Forestry and Logging" = "Forestry and Logging",
                                                     # "Funds, Trusts, and Other Financial Vehicles" = "Funds, Trusts, and Other Financial Vehicles",
                                                     # "Furniture and Home Furnishings Stores" = "Furniture and Home Furnishings Stores",
                                                     # "Furniture and Related Product Mfg" = "Furniture and Related Product Mfg",
                                                     # "Gasoline Stations" = "Gasoline Stations",
                                                     # "General Merchandise Stores" = "General Merchandise Stores",
                                                     # "Health and Personal Care Stores" = "Health and Personal Care Stores",
                                                     # "Health Care and Social Services" = "Health Care and Social Services",
                                                     "Heavy and Civil Engineering Construction" = "Heavy and Civil Engineering Construction",
                                                     "Hospitals" = "Hospitals",
                                                     # "Information" = "Information",
                                                     # 'Insurance Carriers and Related Activities' = "Insurance Carriers and Related Activities",
                                                     # "Leather and Allied Product Manufacturing" = "Leather and Allied Product Manufacturing",
                                                     # "Lessors of Nonfinancial Intangible Assets (except Copyrighted Works)" = "Lessors of Nonfinancial Intangible Assets (except Copyrighted Works)",
                                                     # "Machinery Manufacturing" = "Machinery Manufacturing",
                                                     # "Management of Companies and Enterprises" = "Management of Companies and Enterprises",
                                                     # "Manufacturing" = "Manufacturing",
                                                     # "Merchant Wholesalers, Durable Goods" = "Merchant Wholesalers, Durable Goods",
                                                     # "Merchant Wholesalers, Nondurable Goods" = "Merchant Wholesalers, Nondurable Goods",
                                                     "Mining (Oil and Gas)" = "Mining",
                                                     "Mining (except Oil and Gas)" = "Mining (except Oil and Gas)",
                                                     # "Miscellaneous Manufacturing" = "Miscellaneous Manufacturing",
                                                     # "Miscellaneous Store Retailers" = "Miscellaneous Store Retailers",
                                                     # "Motion Picture & Sound Recording Industries" = "Motion Picture & Sound Recording Industries",
                                                     # "Motor Vehicle and Parts Dealers" = "Motor Vehicle and Parts Dealers",
                                                     # "Museums, Historical Sites, and Similar Institutions" = "Museums, Historical Sites, and Similar Institutions",
                                                     # "Nonmetallic Mineral Product Mfg" = "Nonmetallic Mineral Product Mfg",
                                                     # "Nonstore Retailers" = "Nonstore Retailers",
                                                     # "Nursing and Residential Care Facilities" = "Nursing and Residential Care Facilities",
                                                     "Oil and Gas Extraction" = "Oil and Gas Extraction",
                                                     # "Other Information Services" = "Other Information Services",
                                                     # "Other Services (Except Public Administration)" = "Other Services (Except Public Administration)",
                                                     "Paper Manufacturing" = "Paper Manufacturing",
                                                     # "Performing Arts, Spectator Sports, and Related Industries" = "Performing Arts, Spectator Sports, and Related Industries",
                                                     # "Personal and Laundry Services" = "Personal and Laundry Services",
                                                     "Petroleum and Coal Products Mfg" = "Petroleum and Coal Products Mfg",
                                                     # "Pipeline Transportation" = "Pipeline Transportation",
                                                     "Plastics and Rubber Products Mfg" = "Plastics and Rubber Products Mfg",
                                                     "Postal Service" = "Postal Service",
                                                     "Primary Metal Manufacturing" = "Primary Metal Manufacturing",
                                                     # "Printing and Related Support Activities" = "Printing and Related Support Activities",
                                                     # "Private Households" = "Private Households",
                                                     # "Professional, Scientific, and Technical Services" = "Professional, Scientific, and Technical Services",
                                                     # "Professional, Scientific, Technical" = "Professional, Scientific, Technical",
                                                     # "Publishing Industries (except Internet)" = "Publishing Industries (except Internet)",
                                                     # "Rail Transportation" = "Rail Transportation",
                                                     "Real Estate" = "Real Estate",
                                                     # "Real Estate and Rental and Leasing" = "Real Estate and Rental and Leasing",
                                                     # "Religious, Grantmaking, Civic, Professional, and Similar Organizations" = "Religious, Grantmaking, Civic, Professional, and Similar Organizations",
                                                     # "Rental and Leasing Services" = "Rental and Leasing Services",
                                                     # "Repair and Maintenance" = "Repair and Maintenance",
                                                     # "Retail Trade" = "Retail Trade",
                                                     # "Scenic and Sightseeing Transportation" = "Scenic and Sightseeing Transportation",
                                                     # "Securities, Commodity Contracts, and Other" = "Securities, Commodity Contracts, and Other",
                                                     # "Social Assistance" = "Social Assistance",
                                                     # "Specialty Trade Contractors" = "Specialty Trade Contractors",
                                                     # "Support Activities for Agriculture & Forestry" = "Support Activities for Agriculture & Forestry",
                                                     # "Support Activities for Mining" = "Support Activities for Mining",
                                                     # "Support Activities for Transportation" = "Support Activities for Transportation",
                                                     #"Telecommunications" = "Telecommunications",
                                                     "Textile Mills" = "Textile Mills",
                                                     #"Textile Product Mills" = "Textile Product Mills",
                                                     #"Transit and Ground Passenger Trans." = "Transit and Ground Passenger Trans.",
                                                     #"Transportation & Warehousing" = "Transportation & Warehousing",
                                                     #"Transportation Equipment Manufacturing" = "Transportation Equipment Manufacturing",
                                                     #"Truck Transportation" = "Truck Transportation",
                                                     #"Utilities" = "Utilities",
                                                     #"Waste Mgt. & Remediation Services" = "Waste Mgt. & Remediation Services",
                                                     #"Water Transportation" = "Water Transportation",
                                                     #"Wholesale Elec. Markets & Agents & Brokers" = "Wholesale Elec. Markets & Agents & Brokers",
                                                     #"Wholesale Trade" = "Wholesale Trade",
                                                     "Wood Product Manufacturing" = "Wood Product Manufacturing"
                                                 ),
                                                 
                                                 ## By default we have it set to Manufacuring 
                                                 
                                                 selected = "Paper Manufacturing",
                                                 
                                                 ## We allow multiple inputs to be selected simultaneously
                                                 
                                                 multiple = TRUE
                                     ),
                                     
                                     
                                     hr(),
                                     fluidRow(column(3, verbatimTextOutput("value")))
                              ),
                              
                              
                              ## On the right hand side of the page we display the plot
                              
                              column(5,
                                     
                                     ## The actual plot creation happens below in the server code
                                     
                                     plotOutput("distPlot")
                              ),
                              column(5,
                                     
                                     ## The actual plot creation happens below in the server code
                                     
                                     tableOutput("distTable")
                              )
                              
                          )
                 ),
                 
                 
                 tabPanel("County",
                     
                     fluidRow(
                         column(3,
                                selectInput("radioCounty", label = h3("County"),
                                            choices = list(
                                                "Adams"="Adams",
                                                "Allen"="Allen",
                                                "Bartholomew"="Bartholomew",
                                                "Benton"="Benton",
                                                "Blackford"="Blackford",
                                                "Boone"="Boone",
                                                "Brown"="Brown",
                                                "Carroll"="Carroll",
                                                "Cass"="Cass",
                                                "Clark"="Clark",
                                                "Clay"="Clay",
                                                "Clinton"="Clinton",
                                                "Crawford"="Crawford",
                                                "Daviess"="Daviess",
                                                "Dearborn"="Dearborn",
                                                "Decatur"="Decatur",
                                                "Dekalb"="Dekalb",
                                                "Delaware"="Delaware",
                                                "Dubois"="Dubois",
                                                "Elkhart"="Elkhart",
                                                "Fayette"="Fayette",
                                                "Floyd"="Floyd",
                                                "Fountain"="Fountain",
                                                "Franklin"="Franklin",
                                                "Fulton"="Fulton",
                                                "Gibson"="Gibson",
                                                "Grant"="Grant",
                                                "Greene"="Greene",
                                                "Hamilton"="Hamilton",
                                                "Hancock"="Hancock",
                                                "Harrison"="Harrison",
                                                "Hendricks"="Hendricks",
                                                "Henry"="Henry",
                                                "Howard"="Howard",
                                                "Huntington"="Huntington",
                                                "Jackson"="Jackson",
                                                "Jasper"="Jasper",
                                                "Jay"="Jay",
                                                "Jefferson"="Jefferson",
                                                "Jennings"="Jennings",
                                                "Johnson"="Johnson",
                                                "Knox"="Knox",
                                                "Kosciusko"="Kosciusko",
                                                "Lagrange"="Lagrange",
                                                "Lake"="Lake",
                                                "Laporte"="Laporte",
                                                "Lawrence"="Lawrence",
                                                "Madison"="Madison",
                                                "Marion"="Marion",
                                                "Marshall"="Marshall",
                                                "Martin"="Martin",
                                                "Miami"="Miami",
                                                "Monroe"="Monroe",
                                                "Montgomery"="Montgomery",
                                                "Morgan"="Morgan",
                                                "Newton"="Newton",
                                                "Noble"="Noble",
                                                "Ohio"="Ohio",
                                                "Orange"="Orange",
                                                "Owen"="Owen",
                                                "Parke"="Parke",
                                                "Perry"="Perry",
                                                "Pike"="Pike",
                                                "Porter"="Porter",
                                                "Posey"="Posey",
                                                "Pulaski"="Pulaski",
                                                "Putnam"="Putnam",
                                                "Randolph"="Randolph",
                                                "Ripley"="Ripley",
                                                "Rush"="Rush",
                                                "St. Joseph"="StJoseph",
                                                "Scott"="Scott",
                                                "Shelby"="Shelby",
                                                "Spencer"="Spencer",
                                                "Starke"="Starke",
                                                "Steuben"="Steuben",
                                                "Sullivan"="Sullivan",
                                                "Switzerland"="Switzerland",
                                                "Tippecanoe"="Tippecanoe",
                                                "Tipton"="Tipton",
                                                "Union"="Union",
                                                "Vanderburgh"="Vanderburgh",
                                                "Vermillion"="Vermillion",
                                                "Vigo"="Vigo",
                                                "Wabash"="Wabash",
                                                "Wabash"="Wabash",
                                                "Warrick"="Warrick",
                                                "Washington"="Washington",
                                                "Wayne"="Wayne",
                                                "Wells"="Wells",
                                                "White"="White",
                                                "Whitley"="Whitley"
                                            ),
                                            
                                            ## By default we have it set to white
                                            
                                            selected = "hancock"
                                            ),
                                hr(),
                                fluidRow(column(3, verbatimTextOutput("secondplot")))
                                ),
                         
                         column(6,
                                 ## The actual plot creation happens below in the server code
                                 
                                 plotOutput("distBar")
                                 
                                 )
                         
                         
                     )
                 ),
                 
                 
                 ## About Tab
                 ## Displays some information about the project
                 
                 tabPanel("About",
                          
                          ## This calls a separate RMD sheet and just pastes it here
                          
                          includeMarkdown("about.Rmd")
                 )
                 
)



## Define server logic required to draw a histogram

server <- function(input, output, session) {
    
    ## Get the data we need for plotting
    # load in race by county and race for all of Indiana shapefile
    
    race_shapefile <- st_read("Census_MCD_Ancestry_Ethnicity_IN.shp") %>% 
        clean_names() %>% 
        drop_na()
    
    
    race_dt  <- read_csv("cleaned_race_shapefile.csv")
    
    # load in industries in each county csv
    
    industries  <- read_csv("industries.csv") %>%
        clean_names() %>% 
        drop_na()
    
    # read in merged the lat lng data with industry to get a merged csv
    
    industry_merged_with_lat_lng <- read_csv("industry_geographic.csv")
    
    
    # convert to race shapefile data to sf
    
    race_shapefile_data <- st_as_sf(
        race_shapefile, 
        coords = c("lng", "lat"), 
        crs = 4326
    )
    
    
    
    ## Create the distributional plot
    
    output$distPlot <- renderPlot({
        
        ## Read in the R shiny inputs for which industries and race we are plotting
        
        industy_areas <- input$checkGroup
        ethnicity <- input$radio
        
        
        ## Filter the industry data further
        # select only the industries the user wanted
        
        industry_sub_points <- industry_merged_with_lat_lng %>% 
            filter(naics_code %in% industy_areas) %>% 
            drop_na()
        
        # convert to industry data to sf
        
        industry_geographic_data <- st_as_sf(
            industry_sub_points, 
            coords = c("lng", "lat"),
            crs = 4326
        )
        
        
        ## Finally create the plot
        
        ggplot(race_shapefile_data) + 
            geom_sf(aes(fill = race_shapefile_data[[ethnicity]])) +
            scale_fill_gradientn(colors = c("#e6ecff", "#3366ff", "#001a66")) +
            geom_sf(data = industry_geographic_data, aes(size = count), color=alpha("#b8860b",0.4))
    })
    
    
    ## Create the distributional plot
    
    output$distTable <- renderTable({
        
        ## Read in the R shiny inputs for which industries and race we are plotting
        
        industy_areas <- input$checkGroup
        ethnicity <- input$radio
        
        
        ## Filter the industry data further
        # select only the industries the user wanted
        
        selected <- race_dt %>% 
            select(cnty_name, ethnicity, top_industry) %>% 
            arrange(desc(race_dt[[ethnicity]]))
        
        distinct(selected, cnty_name, .keep_all= TRUE) %>% 
            head(15) %>% 
            gt()
    })
    
    
    
    ## Create the distributional plot
    
    output$distBar <- renderPlot({
        
        ## Read in the R shiny inputs for which industries and race we are plotting
        
        countyArea <- input$radioCounty
        
        
        ## Filter the industry data further
        # select only the industries the user wanted
        
        countySubpoint <- industry_merged_with_lat_lng %>% 
            filter(county %in% countyArea) %>% 
            arrange(desc(count)) %>% 
            head(10)
        
        
        ## Finally create the plot
        
        ggplot(countySubpoint, aes(x=reorder(naics_code, count), y=count)) +
            geom_col() +
            theme(axis.text.x = element_text(angle = 90)) +
            scale_x_discrete(label=function(x) abbreviate(x, minlength=15))
        
    })
}



## Run the Shiny application 

shinyApp(ui = ui, server = server)
