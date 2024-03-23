def parse_invoices(invoice_data)
  pattern = /^(\d{4}-\d{2}-\d{2}) - ([a-z0-9]+) - ([a-z\s]+) - (\$\d+)$/im # YYYY/MM/DD - alphanum - num&spaces - $num
  invoices = invoice_data.scan(pattern) # 2d array depicting each invoice and its details: [invoice[details]...]

  invoices.each do |invoice| # each invoice is an array of its key details
    puts "Date: #{invoice[0]}, Invoice Number: #{invoice[1]}, Client: #{invoice[2]}, Amount: #{invoice[3]}"
  end

end

invoice_entries = <<-INVOICES
2023-03-01 - INV001 - Acme Corp - $1000
2023-03-02 - INV002 - Beta LLC - $2050
2023-03-03 - INV003 - Gamma Inc - $3500
INVOICES

parse_invoices(invoice_entries)
