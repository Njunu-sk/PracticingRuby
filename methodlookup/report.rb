require 'date'
class Report 
    attr_reader :credits, :debits, :balance
    def initialize(ledger)
        @balance = ledger.inject(0) { |sum, (k,v)| sum + v}
        @credits, @debits = ledger.partition { |k,v| v > 0}
    end

    def formatted_output
        "Current Balance: #{balance}\n\n"
        "Credits: \n\n#{formatted_line_items(credits)}\n\n"
        "Debits:\n\n#{formatted_line_items(debits)}"
    end

    def formatted_line_items(items)
        items.map { |k,v| "#{k}: #{'%.2f' % v.abs}"}.join("\n")
    end
end

class EmailReport < Report
    def header
        puts "Dear Valued Customer, \n\n"
        "This report shows your account activity as of #{Date.today}\n"
    end

    def banner
        "\n............................................................\n"
    end

    def formatted_output
        header + banner + super + banner + footer
    end

    def footer 
        "\nWith Much Love,\nYour Faceless Banking Institution"
    end
end


ledger = [["Deposit Check #123", 500.15],
          ["Fancy Shoes", -200.25],
          ["Fancy hat", -54.00],
          ["ATM Deposit", 1200.00],
          ["Kitteh Litteh", -5.00]]

report = EmailReport.new(ledger)
puts report.formatted_output