class Questions {
  final int id, answer;
  final String question;
  final List<String> options;

  Questions(this.id, this.answer, this.question, this.options);
}

const List sample_data = [
  {
    "id": 1,
    "question": "Who invented Bitcoin?",
    "options": [
      'Santoshi Nakamoto',
      'Satoshi Nakamoto',
      'Satoshi Nakamotor',
      'Satoshi Nankamoto'
    ],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "What is the most popular cryptocurrency?",
    "options": ['Ethereum', 'Doge', 'Shiba', 'Bitcoin'],
    "answer_index": 3,
  },
  {
    "id": 3,
    "question": "A digital currency that has its value pegged to a fiat currency is called?",
    "options": ['USDT', 'Bitcoin', 'Stable coin', 'Doge coin'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "Bitcoin was Launched in what year?",
    "options": ['2010', '2011', '2007', '2009'],
    "answer_index": 3,
  },
  {
    "id": 5,
    "question": "What is the second largest crypto currency after bitcoin?",
    "options": ['Doge', 'Ethereum', 'Solana', 'BNB'],
    "answer_index": 1,
  },
  {
    "id": 6,
    "question": "What was one of the problems that Bitcoin solved?",
    "options": [
      'Delayed transfers',
      'Double spending',
      'Delayed Deposit',
      'Inflation'
    ],
    "answer_index": 1,
  },
  {
    "id": 7,
    "question": "What is the name of the CBN digital currency?",
    "options": ['Kobo', 'Naira', 'eNaira ', 'Naira coin'],
    "answer_index": 2,
  },
  {
    "id": 8,
    "question": "This is a graphical representation of the address that can be read by your mobile phone’s camera.",
    "options": ['Bar code', 'QR code', 'URL ', 'All of the above'],
    "answer_index": 3,
  },
  {
    "id": 9,
    "question": "Which of the follwing apps has cheapest trade rates",
    "options": ['Meta mask', 'Kochure', 'Trust wallet', 'Roqqu'],
    "answer_index": 1,
  },
  {
    "id": 10,
    "question": "___provides an additional level of protection against unauthorized access to your crypto exchange account?.",
    "options": ['AML', '2FA', 'KYC', 'FUD'],
    "answer_index": 1,
  },
  {
    "id": 11,
    "question": "___is an automated computer program that is hosted and executed on the blockchain?.",
    "options": [
      'Cryptocurrency',
      'Smart contract',
      'NFT',
      'Smart program',
      'All of the above'
    ],
    "answer_index": 1,
  },
];


