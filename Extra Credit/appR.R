# we set the working directory to the folder that contains the app.r file
# the motivation to doing this, is it would simplify the hosting of the app
# on hugging face which will be done in assignment 03
df = readxl::read_excel(path ='401_data.xlsx', sheet=1, na=c("","**","~","*","#"))
#if you wanted to make values NA repped by NA, use na=c("","**","~","*","#") after sheet


querychat::querychat_app(
  df, "our_data", greeting = "Welcome to Rylee's Data Explorer App!",
  client = "openai/gpt-5-mini-2025-08-07"
)

# query chat is open source
# you are just using an online package
