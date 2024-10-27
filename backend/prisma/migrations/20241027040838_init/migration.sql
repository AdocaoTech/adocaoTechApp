-- CreateEnum
CREATE TYPE "PetStatus" AS ENUM ('AVAILABLE', 'ADOPTED', 'INPROCESS');

-- CreateEnum
CREATE TYPE "PetSize" AS ENUM ('UNDEFINED', 'SMALL', 'MEDIUM', 'BIGGER');

-- CreateEnum
CREATE TYPE "PetPersonality" AS ENUM ('UNDEFINED', 'CALM', 'PLAYFUL', 'INDEPENDENT');

-- CreateEnum
CREATE TYPE "Role" AS ENUM ('USER', 'ADMIN');

-- CreateTable
CREATE TABLE "pet" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "specie" VARCHAR(150) NOT NULL,
    "dob" DATE NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "status" "PetStatus" NOT NULL DEFAULT 'AVAILABLE',
    "size" "PetSize" NOT NULL DEFAULT 'UNDEFINED',
    "personality" "PetPersonality" NOT NULL DEFAULT 'UNDEFINED',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "pet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "phone" VARCHAR(40) NOT NULL,
    "address" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'USER',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "adoption" (
    "id" TEXT NOT NULL,
    "adoption_date" DATE NOT NULL,
    "pet_id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "adoption_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "adoption_pet_id_key" ON "adoption"("pet_id");

-- AddForeignKey
ALTER TABLE "adoption" ADD CONSTRAINT "adoption_pet_id_fkey" FOREIGN KEY ("pet_id") REFERENCES "pet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "adoption" ADD CONSTRAINT "adoption_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
