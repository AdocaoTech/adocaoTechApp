-- CreateEnum
CREATE TYPE "PetGender" AS ENUM ('UNDEFINED', 'MALE', 'FEMALE');

-- AlterTable
ALTER TABLE "pet" ADD COLUMN     "breed" VARCHAR(150),
ADD COLUMN     "gender" "PetGender" NOT NULL DEFAULT 'UNDEFINED';
