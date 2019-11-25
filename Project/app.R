## Gayatri Balasubramanian
## GOV 1005 Final Project Shiny Web Application

library(sf)
library(shiny)
library(markdown)
library(tidyverse)


## Define UI for application that draws a histogram

ui <- navbarPage("Milestone 8",
                 
                 ## About page
                 
                 tabPanel("About",
                          includeMarkdown("about.Rmd")
                 ),
                 
                 
                 ## Plot Ethnicities all of Indiana
                 
                 tabPanel("Plot",
                          fluidRow(
                              column(3,
                                  # make a group of radio buttons
                                  radioButtons("radio", label = h3("Ethnic Descent"),
                                               choices = list("armenia" = "armenia",
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
                                                 "amindan" = "amindan",
                                                 "asian" = "asian" 
                                                 ),
                                               selected = "white"),
                                  
                                  # make a group of checkboxes for industry
                                  checkboxGroupInput("checkGroup", label = h3("Industry"), 
                                                     choices = list(
                                                         "Elec. Equip., App., & Component Mfg" = "Elec. Equip., App., & Component Mfg", 
                                                         "Internet Srv. Prov., Web Search Portals, & Data Processing Services" = "Internet Srv. Prov., Web Search Portals, & Data Processing Services", 
                                                         "Sporting Goods, Hobby, Book, & Music Stores" = "Sporting Goods, Hobby, Book, & Music Stores",
                                                         "Accommodation" = "Accommodation",
                                                         "Accommodation and Food Services" = "Accommodation and Food Services",
                                                         "Admin, Support, Waste" = "Admin, Support, Waste",
                                                         "Agriculture, Forestry, Fishing and Hunting" = "Agriculture, Forestry, Fishing and Hunting",
                                                         "Air Transportation" = "Air Transportation",
                                                         "Ambulatory Health Care Services" = "Ambulatory Health Care Services",
                                                         "Amusement, Gambling, and Recreation Industries" = "Amusement, Gambling, and Recreation Industries",
                                                         "Animal Production" = "Animal Production",
                                                         "Apparel Manufacturing" = "Apparel Manufacturing",
                                                         "Arts, Entertainment, and Recreation" = "Arts, Entertainment, and Recreation",
                                                         "Beverage and Tobacco Product Mfg" = "Beverage and Tobacco Product Mfg",
                                                         "Bldg. Mat. & Garden Equip. & Supp. Dealers" = "Bldg. Mat. & Garden Equip. & Supp. Dealers",
                                                         "Broadcasting (except Internet)" = "Broadcasting (except Internet)",
                                                         "Chemical Manufacturing" = "Chemical Manufacturing",
                                                         "Clothing and Clothing Accessories Stores" = "Clothing and Clothing Accessories Stores",
                                                         "Computer and Electronic Product Mfg" = "Computer and Electronic Product Mfg",
                                                         "Construction" = "Construction",
                                                         "Construction of Buildings" = "Construction of Buildings",
                                                         "Couriers and Messengers" = "Couriers and Messengers",
                                                         "Credit Intermediation and Related Activities" = "Credit Intermediation and Related Activities",
                                                         "Credit Intermediation and Related Activities" = "Credit Intermediation and Related Activities",
                                                         "Crop Production" = "Crop Production",
                                                         "Educational Services" = "Educational Services",
                                                         "Electronics and Appliance Stores" = "Electronics and Appliance Stores",
                                                         "Fabricated Metal Product Mfg" = "Fabricated Metal Product Mfg",
                                                         "Finance and Insurance" = "Finance and Insurance",
                                                         "Fishing, Hunting and Trapping" = "Fishing, Hunting and Trapping",
                                                         "Food and Beverage Stores" = "Food and Beverage Stores",
                                                         "Food Manufacturing" = "Food Manufacturing",
                                                         "Food Services and Drinking Places" = "Food Services and Drinking Places",
                                                         "Forestry and Logging" = "Forestry and Logging",
                                                         "Funds, Trusts, and Other Financial Vehicles" = "Funds, Trusts, and Other Financial Vehicles",
                                                         "Furniture and Home Furnishings Stores" = "Furniture and Home Furnishings Stores",
                                                         "Furniture and Related Product Mfg" = "Furniture and Related Product Mfg",
                                                         "Gasoline Stations" = "Gasoline Stations",
                                                         "General Merchandise Stores" = "General Merchandise Stores",
                                                         "Health and Personal Care Stores" = "Health and Personal Care Stores",
                                                         "Health Care and Social Services" = "Health Care and Social Services",
                                                         "Heavy and Civil Engineering Construction" = "Heavy and Civil Engineering Construction",
                                                         "Hospitals" = "Hospitals",
                                                         "Information" = "Information",
                                                         'Insurance Carriers and Related Activities' = "Insurance Carriers and Related Activities",
                                                         "Leather and Allied Product Manufacturing" = "Leather and Allied Product Manufacturing",
                                                         "Lessors of Nonfinancial Intangible Assets (except Copyrighted Works)" = "Lessors of Nonfinancial Intangible Assets (except Copyrighted Works)",
                                                         "Machinery Manufacturing" = "Machinery Manufacturing",
                                                         "Management of Companies and Enterprises" = "Management of Companies and Enterprises",
                                                         "Manufacturing" = "Manufacturing",
                                                         "Merchant Wholesalers, Durable Goods" = "Merchant Wholesalers, Durable Goods",
                                                         "Merchant Wholesalers, Nondurable Goods" = "Merchant Wholesalers, Nondurable Goods",
                                                         "Mining (Oil and Gas)" = "Mining",
                                                         "Mining (except Oil and Gas)" = "Mining (except Oil and Gas)",
                                                         "Miscellaneous Manufacturing" = "Miscellaneous Manufacturing",
                                                         "Miscellaneous Store Retailers" = "Miscellaneous Store Retailers",
                                                         "Motion Picture & Sound Recording Industries" = "Motion Picture & Sound Recording Industries",
                                                         "Motor Vehicle and Parts Dealers" = "Motor Vehicle and Parts Dealers",
                                                         "Museums, Historical Sites, and Similar Institutions" = "Museums, Historical Sites, and Similar Institutions",
                                                         "Nonmetallic Mineral Product Mfg" = "Nonmetallic Mineral Product Mfg",
                                                         "Nonstore Retailers" = "Nonstore Retailers",
                                                         "Nursing and Residential Care Facilities" = "Nursing and Residential Care Facilities",
                                                         "Oil and Gas Extraction" = "Oil and Gas Extraction",
                                                         "Other Information Services" = "Other Information Services",
                                                         "Other Services (Except Public Administration)" = "Other Services (Except Public Administration)",
                                                         "Paper Manufacturing" = "Paper Manufacturing",
                                                         "Performing Arts, Spectator Sports, and Related Industries" = "Performing Arts, Spectator Sports, and Related Industries",
                                                         "Personal and Laundry Services" = "Personal and Laundry Services",
                                                         "Petroleum and Coal Products Mfg" = "Petroleum and Coal Products Mfg",
                                                         "Pipeline Transportation" = "Plastics and Rubber Products Mfg",
                                                         "Postal Service" = "Postal Service",
                                                         "Primary Metal Manufacturing" = "Primary Metal Manufacturing",
                                                         "Printing and Related Support Activities" = "Printing and Related Support Activities",
                                                         "Private Households" = "Private Households",
                                                         "Professional, Scientific, and Technical Services" = "Professional, Scientific, and Technical Services",
                                                         "Professional, Scientific, Technical" = "Professional, Scientific, Technical",
                                                         "Publishing Industries (except Internet)" = "Publishing Industries (except Internet)",
                                                         "Rail Transportation" = "Rail Transportation",
                                                         "Real Estate" = "Real Estate",
                                                         "Real Estate and Rental and Leasing" = "Real Estate and Rental and Leasing",
                                                         "Religious, Grantmaking, Civic, Professional, and Similar Organizations" = "Religious, Grantmaking, Civic, Professional, and Similar Organizations",
                                                         "Rental and Leasing Services" = "Rental and Leasing Services",
                                                         "Repair and Maintenance" = "Repair and Maintenance",
                                                         "Retail Trade" = "Retail Trade",
                                                         "Scenic and Sightseeing Transportation" = "Scenic and Sightseeing Transportation",
                                                         "Securities, Commodity Contracts, and Other" = "Securities, Commodity Contracts, and Other",
                                                         "Social Assistance" = "Social Assistance",
                                                         "Specialty Trade Contractors" = "Specialty Trade Contractors",
                                                         "Support Activities for Agriculture & Forestry" = "Support Activities for Agriculture & Forestry",
                                                         "Support Activities for Mining" = "Support Activities for Mining",
                                                         "Support Activities for Transportation" = "Support Activities for Transportation",
                                                         "Telecommunications" = "Telecommunications",
                                                         "Textile Mills" = "Textile Mills",
                                                         "Textile Product Mills" = "Textile Product Mills",
                                                         "Transit and Ground Passenger Trans." = "Transit and Ground Passenger Trans.",
                                                         "Transportation & Warehousing" = "Transportation & Warehousing",
                                                         "Transportation Equipment Manufacturing" = "Transportation Equipment Manufacturing",
                                                         "Truck Transportation" = "Truck Transportation",
                                                         "Utilities" = "Utilities",
                                                         "Waste Mgt. & Remediation Services" = "Waste Mgt. & Remediation Services",
                                                         "Water Transportation" = "Water Transportation",
                                                         "Wholesale Elec. Markets & Agents & Brokers" = "Wholesale Elec. Markets & Agents & Brokers",
                                                         "Wholesale Trade" = "Wholesale Trade",
                                                         "Wood Product Manufacturing" = "Wood Product Manufacturing"
                                                        ),
                                                     selected = "Manufacturing"),
                                  
                                  
                                  hr(),
                                  fluidRow(column(3, verbatimTextOutput("value")))
                              ),
                              column(6,
                                     plotOutput("distPlot")
                              )
                          )
                 )
                 
)

# Define server logic required to draw a histogram


server <- function(input, output, session) {
    shape <- st_read("Census_MCD_Ancestry_Ethnicity_IN.shp") %>% 
        clean_names()
    
    races  <- read_csv("all_races.csv") %>%
        clean_names()
    
    industries  <- read_csv("industries.csv") %>%
        clean_names()
    
    lat_lng  <- read_csv("lat_lng.csv") %>%
        clean_names()
    
    
    total <- merge(industries,lat_lng,by="county")
    
    oc_data <- st_as_sf(
        shape, 
        coords = c("lng", "lat"), 
        crs = 4326
    )
    
    # You can access the values of the widget (as a vector)
    # with input$checkGroup, e.g.
    #output$value <- renderPrint({ input$radio })
    
    output$distPlot <- renderPlot({
        area <- input$checkGroup
        ethnicity <- input$radio
        
        sub_points <- total %>% 
            filter(naics_code %in% area)
        
        # transform tibble to sf data
        oc_data_subset_sf <- st_as_sf(
            sub_points, 
            coords = c("lng", "lat"),
            crs = 4326
        )
        
        ggplot(oc_data) + 
            geom_sf(aes(fill = white)) +
            scale_fill_gradientn(colors = c("#e6ecff", "#3366ff", "#001a66")) +
            geom_sf(data = oc_data_subset_sf, aes(size = count), color=alpha("#800080",0.4))
        
    })
}


# Run the application 
shinyApp(ui = ui, server = server)
