const { PrismaClient } = require("@prisma/client");
const fs = require("fs");
const prisma = new PrismaClient();



beforeAll(async () => {
  await prisma.$connect();
  await prisma.$executeRaw`PRAGMA foreign_keys = ON;`;
});

afterAll(async () => {
  await prisma.$disconnect();
  if (fs.existsSync("./test.db")) {
    fs.unlinkSync("./test.db");
  }
});

describe("Pet Model", () => {
  afterAll(async () => {
    await prisma.$disconnect();
  });

  it("teste cadastra novo pet", async () => {
    const newPet = await prisma.pet.create({
      data: {
        name: "Lilica",
        specie: "Dog",
        breed: "stray",
        gender: "FEMALE",
        dob: new Date("2020-01-01"),
        description: "Uma cadela hiperativa e carinhosa para animar sua casa.",
        status: "AVAILABLE",
        size: "SMALL",
        personality: "PLAYFUL",
      },
    });

    expect(newPet).toHaveProperty("id");
    expect(newPet.name).toBe("Lilica");
    expect(newPet.specie).toBe("Dog");
    expect(newPet.dob).toEqual(new Date("2020-01-01"));
    expect(newPet.description).toBe(
      "Uma cadela hiperativa e carinhosa para animar sua casa."
    );
    expect(newPet.status).toBe("AVAILABLE");
    expect(newPet.size).toBe("SMALL");
    expect(newPet.personality).toBe("PLAYFUL");
  });
});
