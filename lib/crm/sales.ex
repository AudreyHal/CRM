defmodule Crm.Sales do
  import Ecto.Query, warn: false
  alias Crm.Repo
  alias Crm.Sales.{Account, Lead, Opportunity, Note}

  #---------------------------- Account--------------------------- #

  def list_accounts do
    Repo.all(Account)
  end

  def list_repo_accounts do
    Repo.all(Account) |> Enum.map(&{&1.name, &1.id})
  end

  def get_account!(id), do: Repo.get!(Account, id) |> Repo.preload(:notes) |> Repo.preload(:opportunities)


  def create_account(attrs \\ %{}) do
    %Account{}
    |> Account.changeset(attrs)
    |> Repo.insert()
  end

  def update_account(%Account{} = account, attrs) do
    account
    |> Account.changeset(attrs)
    |> Repo.update()
  end

  def delete_account(%Account{} = account) do
    Repo.delete(account)
  end

  def change_account(%Account{} = account) do
    Account.changeset(account, %{})
  end

  #---------------------------- Lead --------------------------- #
  def list_leads do
    Repo.all(Lead)
  end

  def get_lead!(id), do: Repo.get!(Lead, id) |> Repo.preload(:notes)

  def create_lead(attrs \\ %{}) do
    %Lead{}
    |> Lead.changeset(attrs)
    |> Repo.insert()
  end

  def update_lead(%Lead{} = lead, attrs) do
    lead
    |> Lead.changeset(attrs)
    |> Repo.update()
  end

  def delete_lead(%Lead{} = lead) do
    Repo.delete(lead)
  end

  def change_lead(%Lead{} = lead) do
    Lead.changeset(lead, %{})
  end

  def get_title do
    ["Mr", "Mrs", "Miss", "Dr.", "Prof."]
  end

  def get_statuses do
    ["New", "Contacted", "Converted", "Rejected", "Other"]
  end

  def get_countries do
    ["Afghanistan", "Albania", "Algeria", "American Samoa", "Angola", "Anguilla", "Antartica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Ashmore and Cartier Island", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "British Virgin Islands", "Brunei", "Bulgaria", "Burkina Faso", "Burma", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Clipperton Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo, Democratic Republic of the", "Congo, Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba", "Cyprus", "Czeck Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Europa Island", "Falkland Islands (Islas Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "French Guiana", "French Polynesia", "French Southern and Antarctic Lands", "Gabon", "Gambia, The", "Gaza Strip", "Georgia", "Germany", "Ghana", "Gibraltar", "Glorioso Islands", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard Island and McDonald Islands", "Holy See (Vatican City)", "Honduras", "Hong Kong", "Howland Island", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Ireland, Northern", "Israel", "Italy", "Jamaica", "Jan Mayen", "Japan", "Jarvis Island", "Jersey", "Johnston Atoll", "Jordan", "Juan de Nova Island", "Kazakhstan", "Kenya", "Kiribati", "Korea, North", "Korea, South", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Man, Isle of", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Midway Islands", "Moldova", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcaim Islands", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romainia", "Russia", "Rwanda", "Saint Helena", "Saint Kitts and Nevis", "Saint Lucia", "Saint Pierre and Miquelon", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Scotland", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and South Sandwich Islands", "Spain", "Spratly Islands", "Sri Lanka", "Sudan", "Suriname", "Svalbard", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Tobago", "Toga", "Tokelau", "Tonga", "Trinidad", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "Uruguay", "USA", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands", "Wales", "Wallis and Futuna", "West Bank", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"]
  end



  #---------------------------- Opportunity --------------------------- #
  def list_opportunities do
    Repo.all(Opportunity)
  end

  def get_opportunity_account(opportunity) do
    id = Map.get(opportunity, "account_id")
    |> get_account!()
  end

  def get_opportunity!(id), do: Repo.get!(Opportunity, id) |> Repo.preload(:account) |> Repo.preload(:notes)

  def create_opportunity(%Account{} = account, attrs \\ %{}) do
    account
    |> Ecto.build_assoc(:opportunities)
    |> Opportunity.changeset(attrs)
    |> Repo.insert()
  end

  def update_opportunity(%Opportunity{} = opportunity, attrs) do
    opportunity
    |> Opportunity.changeset(attrs)
    |> Repo.update()
  end

  def delete_opportunity(%Opportunity{} = opportunity) do
    Repo.delete(opportunity)
  end

  def change_opportunity(%Opportunity{} = opportunity) do
    Opportunity.changeset(opportunity, %{})
  end



  #---------------------------- Contact --------------------------- #

  alias Crm.Sales.Contact

  @doc """
  Returns the list of contacts.

  ## Examples

      iex> list_contacts()
      [%Contact{}, ...]

  """
  def list_contacts do
    Repo.all(Contact) |> Repo.preload(:account)
  end

  @doc """
  Gets a single contact.

  Raises `Ecto.NoResultsError` if the Contact does not exist.

  ## Examples

      iex> get_contact!(123)
      %Contact{}

      iex> get_contact!(456)
      ** (Ecto.NoResultsError)

  """
  def get_contact!(id), do: Repo.get!(Contact, id)|> Repo.preload(:account) |> Repo.preload(:notes)

  @doc """
  Creates a contact.

  ## Examples

      iex> create_contact(%{field: value})
      {:ok, %Contact{}}

      iex> create_contact(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_contact(%Account{} = account, attrs \\ %{}) do
    account
    |> Ecto.build_assoc(:contacts)
    |> Contact.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a contact.

  ## Examples

      iex> update_contact(contact, %{field: new_value})
      {:ok, %Contact{}}

      iex> update_contact(contact, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_contact(%Contact{} = contact, attrs) do
    contact
    |> Contact.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Contact.

  ## Examples

      iex> delete_contact(contact)
      {:ok, %Contact{}}

      iex> delete_contact(contact)
      {:error, %Ecto.Changeset{}}

  """
  def delete_contact(%Contact{} = contact) do
    Repo.delete(contact)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking contact changes.

  ## Examples

      iex> change_contact(contact)
      %Ecto.Changeset{source: %Contact{}}

  """
  def change_contact(%Contact{} = contact) do
    Contact.changeset(contact, %{})
  end

  def create_note_contact(%Contact{} = contact, attrs \\ %{}) do
    contact
    |> Ecto.build_assoc(:notes)
    |> Note.changeset(attrs)
    |> Repo.insert()
  end



  #---------------------------- Notes --------------------------- #

  alias Crm.Sales.Note

  @doc """
  Returns the list of notes.

  ## Examples

      iex> list_notes()
      [%Note{}, ...]

  """
  def list_notes do
    Repo.all(Note)
  end

  @doc """
  Gets a single note.

  Raises `Ecto.NoResultsError` if the Note does not exist.

  ## Examples

      iex> get_note!(123)
      %Note{}

      iex> get_note!(456)
      ** (Ecto.NoResultsError)

  """
  def get_note!(id), do: Repo.get!(Note, id)

  @doc """
  Creates a note.

  ## Examples

      iex> create_note(%{field: value})
      {:ok, %Note{}}

      iex> create_note(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_note(attrs \\ %{}) do
    %Note{}
    |> Note.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a note.

  ## Examples

      iex> update_note(note, %{field: new_value})
      {:ok, %Note{}}

      iex> update_note(note, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_note(%Note{} = note, attrs) do
    note
    |> Note.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Note.

  ## Examples

      iex> delete_note(note)
      {:ok, %Note{}}

      iex> delete_note(note)
      {:error, %Ecto.Changeset{}}

  """
  def delete_note(%Note{} = note) do
    Repo.delete(note)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking note changes.

  ## Examples

      iex> change_note(note)
      %Ecto.Changeset{source: %Note{}}

  """
  def change_note(%Note{} = note) do
    Note.changeset(note, %{})
  end


  #---------------------------- Add Note Functionality--------------------------- #

  def create_account_note(%Account{} = account, attrs \\ %{}) do
    build_account_note(account, attrs)
    |> Repo.insert()
  end


  def build_account_note(%Account{} = account, attrs \\ %{}) do
    Ecto.build_assoc(account, :notes)
    |> Note.changeset(attrs)
   end

   def create_opportunity_note(%Opportunity{} = opportunity, attrs \\ %{}) do
    build_opportunity_note(opportunity, attrs)
    |> Repo.insert()
  end


  def build_opportunity_note(%Opportunity{} = opportunity, attrs \\ %{}) do
    Ecto.build_assoc(opportunity, :notes)
    |> Note.changeset(attrs)
   end


   def create_lead_note(%Lead{} = lead, attrs \\ %{}) do
    build_lead_note(lead, attrs)
    |> Repo.insert()
  end

  def build_lead_note(%Lead{} = lead, attrs \\ %{}) do
    Ecto.build_assoc(lead, :notes)
    |> Note.changeset(attrs)
   end

   def create_contact_note(%Contact{} = contact, attrs \\ %{}) do
    build_contact_note(contact, attrs)
    |> Repo.insert()
  end


  def build_contact_note(%Contact{} = contact, attrs \\ %{}) do
    Ecto.build_assoc(contact, :notes)
    |> Note.changeset(attrs)
   end

end
