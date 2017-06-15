medium_text = "This is some text that is quite long.\nA long long text\nSome longity one day a fish went\nLong long ago. Wiggly woo. Wiggly woo. Let's\n all do the wiggly woo.This is some text that is quite long.\nA long long text\nSome longity one day a fish went\nLong long ago. Wiggly woo. Wiggly woo. Let's\n all do the wiggly woo."
MEDIUM_TEXT = medium_text + medium_text + medium_text
class BarApp
  def call env
    status = 200
    headers = {'Content-Type' => 'application/json'}
    body = {
        thing: [1],
        array: [1, 2, 3],
        nested: {
          long: {
            path: {
              to: {
                a: {
                  person: {
                    firstName: "Bar",
                    surname: "Wiffle",
                    middleName: "Roger",
                    nickname: "Poopsy",
                    maidenName: "Jones",
                    driversLicence: "EFG567"
                  },
                }
              }
            }
          }
        },
        address: "200 Bourke St, Melbourne",
        phone: {
          mobile: "0412 746 345"
        },
        mother: nil,
        father: "James",
        favouriteColours: ["red", MEDIUM_TEXT],
        favouriteMovies: ["Jaws"],
        children: [{name: "Joseph", age: "three and a half"}, {name: "Jane", age: "twelve"}],
        parents: [{name: "Adam"}, {name: "Eve"}, {name: "Frank"}]
    }.to_json
    [status, headers, [body]]
  end
end
