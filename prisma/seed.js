const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function seed() {
  // Add your code here
  const createdCustomerAndContact = await prisma.customer.create({
    data: {
      name: "Alice",
      contact: {
        create: {
          phone: "+353878041625",
          email: "aliceinwonderland@gmail.com",
        },
      },
    },
  });

  console.log("Customer created", createdCustomerAndContact);

  const createdMovieAndScreening = await prisma.movie.create({
    data: {
      title: "The General",
      runtimeMins: 120,
      screening: {
        create: [
          {
            startsAt: new Date("2022-01-30T12:00:00Z"),
          },
          {
            startsAt: new Date("2022-01-30T12:30:00Z"),
          },
        ],
      },
    },
  });

  console.log("Linked movie screen time", createdMovieAndScreening);

  const createdScreenAndScreening = await prisma.screen.create({
    data: {
      number: 1,
      screening: {
        create: [
          {
            startsAt: new Date("2022-01-30T12:00:00Z"),
          },
          {
            startsAt: new Date("2022-01-30T12:00:00Z"),
          },
        ],
      },
    },
  });

  console.log("Linked screen with viewing time", createdScreenAndScreening);

  const createdCustomerScreeningTicket = await prisma.ticket.create({
    data: {
      screening: {
        connect: {
          id: createdScreenAndScreening.id,
        },
      },
      customer: {
        connect: {
          id: createdCustomerAndContact.id,
        },
      },
    },
  });

  console.log(
    "Created customer-screening-ticket link",
    createdCustomerScreeningTicket
  );

  // Don't edit any of the code below this line
  process.exit(0);
}

seed().catch(async (error) => {
  console.error(error);
  await prisma.$disconnect();
  process.exit(1);
});
