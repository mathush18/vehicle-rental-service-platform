/* FRONTEND MOCK DATA: display samples only; no API, sessions or persistence. */
window.DriveHubDemo = {
  "fleet": [
    {
      "id": 1,
      "name": "Toyota Corolla",
      "brand": "Toyota",
      "model": "Corolla",
      "type": "Car",
      "price": 8000,
      "branch": "Colombo",
      "rating": "4.8",
      "reviews": 120,
      "status": "Available"
    },
    {
      "id": 2,
      "name": "Toyota Hiace",
      "brand": "Toyota",
      "model": "Hiace",
      "type": "Van",
      "price": 12000,
      "branch": "Kandy",
      "rating": "4.6",
      "reviews": 85,
      "status": "Rented"
    },
    {
      "id": 3,
      "name": "Yamaha FZ-S",
      "brand": "Yamaha",
      "model": "FZ-S",
      "type": "Motorcycle",
      "price": 3500,
      "branch": "Colombo",
      "rating": "4.5",
      "reviews": 60,
      "status": "Available"
    },
    {
      "id": 4,
      "name": "Toyota RAV4",
      "brand": "Toyota",
      "model": "RAV4",
      "type": "SUV",
      "price": 15000,
      "branch": "Galle",
      "rating": "4.7",
      "reviews": 90,
      "status": "Available"
    },
    {
      "id": 5,
      "name": "Honda Civic",
      "brand": "Honda",
      "model": "Civic",
      "type": "Car",
      "price": 9000,
      "branch": "Colombo",
      "rating": "4.6",
      "reviews": 75,
      "status": "Unavailable"
    },
    {
      "id": 6,
      "name": "Nissan NV350",
      "brand": "Nissan",
      "model": "NV350",
      "type": "Van",
      "price": 11000,
      "branch": "Jaffna",
      "rating": "4.5",
      "reviews": 68,
      "status": "Available"
    },
    {
      "id": 7,
      "name": "Honda CB150R",
      "brand": "Honda",
      "model": "CB150R",
      "type": "Motorcycle",
      "price": 4000,
      "branch": "Kandy",
      "rating": "4.4",
      "reviews": 55,
      "status": "Available"
    },
    {
      "id": 8,
      "name": "Toyota Fortuner",
      "brand": "Toyota",
      "model": "Fortuner",
      "type": "SUV",
      "price": 18000,
      "branch": "Colombo",
      "rating": "4.6",
      "reviews": 95,
      "status": "Rented"
    }
  ],
  "branches": [
    {
      "id": 1,
      "name": "Colombo Branch",
      "city": "Colombo",
      "address": "123 Main Street, Colombo 03",
      "phone": "+94 11 234 5678",
      "count": 16,
      "status": "Active"
    },
    {
      "id": 2,
      "name": "Kandy Branch",
      "city": "Kandy",
      "address": "45 Peradeniya Road, Kandy",
      "phone": "+94 81 234 5678",
      "count": 12,
      "status": "Active"
    },
    {
      "id": 3,
      "name": "Galle Branch",
      "city": "Galle",
      "address": "18 Lighthouse Street, Galle",
      "phone": "+94 91 234 5678",
      "count": 8,
      "status": "Active"
    },
    {
      "id": 4,
      "name": "Jaffna Branch",
      "city": "Jaffna",
      "address": "27 Hospital Road, Jaffna",
      "phone": "+94 21 234 5678",
      "count": 6,
      "status": "Active"
    },
    {
      "id": 5,
      "name": "Matara Branch",
      "city": "Matara",
      "address": "62 Beach Road, Matara",
      "phone": "+94 41 234 5678",
      "count": 4,
      "status": "Inactive"
    }
  ],
  "rentals": [
    {
      "id": 1,
      "vehicle": 1,
      "name": "Nimal Perera",
      "start": "Oct 15, 2026",
      "end": "Oct 18, 2026",
      "amount": 26000,
      "status": "Pending"
    },
    {
      "id": 2,
      "vehicle": 3,
      "name": "Sahan Wijesinghe",
      "start": "Oct 14, 2026",
      "end": "Oct 16, 2026",
      "amount": 7000,
      "status": "Approved"
    },
    {
      "id": 3,
      "vehicle": 2,
      "name": "Dinuka Silva",
      "start": "Oct 12, 2026",
      "end": "Oct 15, 2026",
      "amount": 36000,
      "status": "Completed"
    },
    {
      "id": 4,
      "vehicle": 4,
      "name": "Kavindu Perera",
      "start": "Oct 10, 2026",
      "end": "Oct 12, 2026",
      "amount": 30000,
      "status": "Cancelled"
    },
    {
      "id": 5,
      "vehicle": 5,
      "name": "Tharushi Fernando",
      "start": "Oct 8, 2026",
      "end": "Oct 10, 2026",
      "amount": 18000,
      "status": "Approved"
    },
    {
      "id": 6,
      "vehicle": 6,
      "name": "Akila Samarasekara",
      "start": "Oct 7, 2026",
      "end": "Oct 9, 2026",
      "amount": 22000,
      "status": "Rejected"
    }
  ],
  "myRentals": [
    {
      "id": 1,
      "vehicle": 1,
      "start": "Oct 18, 2026",
      "end": "Oct 21, 2026",
      "amount": 26000,
      "status": "Pending",
      "group": "Upcoming"
    },
    {
      "id": 2,
      "vehicle": 3,
      "start": "Oct 10, 2026",
      "end": "Oct 12, 2026",
      "amount": 7000,
      "status": "Completed",
      "group": "Completed"
    },
    {
      "id": 3,
      "vehicle": 2,
      "start": "Oct 5, 2026",
      "end": "Oct 8, 2026",
      "amount": 36000,
      "status": "Cancelled",
      "group": "Cancelled"
    }
  ],
  "payments": [
    {
      "id": 1,
      "customer": "Nimal Perera",
      "vehicle": 1,
      "date": "Oct 10, 2026",
      "amount": 24000,
      "method": "Card",
      "status": "Paid"
    },
    {
      "id": 2,
      "customer": "Sahan Wijesinghe",
      "vehicle": 3,
      "date": "Oct 8, 2026",
      "amount": 7000,
      "method": "Bank Transfer",
      "status": "Paid"
    },
    {
      "id": 3,
      "customer": "Dinuka Silva",
      "vehicle": 2,
      "date": "Oct 5, 2026",
      "amount": 36000,
      "method": "eWallet",
      "status": "Refunded"
    },
    {
      "id": 4,
      "customer": "Kavindu Perera",
      "vehicle": 4,
      "date": "Sep 20, 2026",
      "amount": 30000,
      "method": "Card",
      "status": "Pending"
    },
    {
      "id": 5,
      "customer": "Tharushi Fernando",
      "vehicle": 5,
      "date": "Sep 10, 2026",
      "amount": 18000,
      "method": "eWallet",
      "status": "Failed"
    }
  ],
  "reviewData": [
    {
      "id": 1,
      "vehicle": 1,
      "date": "Oct 10, 2026",
      "rating": 5,
      "comment": "Great car! Very comfortable and fuel efficient. Perfect for city travel."
    },
    {
      "id": 2,
      "vehicle": 3,
      "date": "Oct 5, 2026",
      "rating": 4,
      "comment": "Good bike for short trips. Smooth ride and well maintained."
    }
  ],
  "adminReviews": [
    [
      "Nimal Perera",
      1,
      5,
      "Great car! Very comfortable and fuel efficient.",
      "Approved"
    ],
    [
      "Sahan Wijesinghe",
      3,
      4,
      "Good bike for short trips.",
      "Approved"
    ],
    [
      "Dinuka Silva",
      2,
      3,
      "Spacious and clean.",
      "Approved"
    ],
    [
      "Kavindu Perera",
      4,
      5,
      "Excellent SUV, smooth ride.",
      "Pending"
    ],
    [
      "Tharushi Fernando",
      7,
      4,
      "Well maintained bike.",
      "Approved"
    ]
  ],
  "users": [
    [
      "Nimal Perera",
      "nimal@mail.com",
      "Customer",
      "+94 77 123 4567",
      "Active"
    ],
    [
      "Kavindu Silva",
      "kavindu@gmail.com",
      "Owner",
      "+94 71 234 5678",
      "Active"
    ],
    [
      "Sahan Wijesinghe",
      "sahan@gmail.com",
      "Customer",
      "+94 76 345 6789",
      "Inactive"
    ],
    [
      "Dinuka Perera",
      "dinuka@gmail.com",
      "Admin",
      "+94 75 456 7890",
      "Active"
    ],
    [
      "Tharushi Fernando",
      "tharushi@gmail.com",
      "Owner",
      "+94 70 567 8901",
      "Active"
    ],
    [
      "Akila Samarasekara",
      "akila@gmail.com",
      "Customer",
      "+94 71 678 9012",
      "Active"
    ],
    [
      "Ruwan Nendis",
      "ruwan@gmail.com",
      "Customer",
      "+94 77 789 0123",
      "Inactive"
    ],
    [
      "Mathushalini.T",
      "mathushalini@example.com",
      "Admin",
      "+94 77 123 4567",
      "Active"
    ]
  ]
};
