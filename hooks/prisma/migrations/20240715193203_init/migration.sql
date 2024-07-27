-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "firstName" TEXT,
    "lastName" TEXT,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Hap" (
    "id" TEXT NOT NULL,
    "triggerId" TEXT,
    "metadata" JSONB NOT NULL,

    CONSTRAINT "Hap_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Trigger" (
    "id" TEXT NOT NULL,
    "hapId" TEXT NOT NULL,
    "triggerType" INTEGER NOT NULL,
    "metadata" JSONB NOT NULL,

    CONSTRAINT "Trigger_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Action" (
    "id" TEXT NOT NULL,
    "hapId" TEXT NOT NULL,
    "metadata" JSONB NOT NULL,
    "actionType" INTEGER NOT NULL,
    "order" INTEGER NOT NULL,

    CONSTRAINT "Action_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AvailableAction" (
    "id" SERIAL NOT NULL,
    "actionName" TEXT NOT NULL,

    CONSTRAINT "AvailableAction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AvailableTrigger" (
    "id" SERIAL NOT NULL,
    "triggerName" TEXT NOT NULL,

    CONSTRAINT "AvailableTrigger_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HapRun" (
    "id" TEXT NOT NULL,
    "createdDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "hapId" TEXT NOT NULL,

    CONSTRAINT "HapRun_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HapRunOutbox" (
    "id" TEXT NOT NULL,
    "hapRunId" TEXT NOT NULL,

    CONSTRAINT "HapRunOutbox_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_id_key" ON "User"("id");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Hap_id_key" ON "Hap"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Trigger_id_key" ON "Trigger"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Trigger_hapId_key" ON "Trigger"("hapId");

-- CreateIndex
CREATE UNIQUE INDEX "Action_id_key" ON "Action"("id");

-- CreateIndex
CREATE UNIQUE INDEX "AvailableAction_id_key" ON "AvailableAction"("id");

-- CreateIndex
CREATE UNIQUE INDEX "AvailableTrigger_id_key" ON "AvailableTrigger"("id");

-- CreateIndex
CREATE UNIQUE INDEX "HapRun_id_key" ON "HapRun"("id");

-- CreateIndex
CREATE UNIQUE INDEX "HapRunOutbox_hapRunId_key" ON "HapRunOutbox"("hapRunId");

-- AddForeignKey
ALTER TABLE "Trigger" ADD CONSTRAINT "Trigger_triggerType_fkey" FOREIGN KEY ("triggerType") REFERENCES "AvailableTrigger"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trigger" ADD CONSTRAINT "Trigger_hapId_fkey" FOREIGN KEY ("hapId") REFERENCES "Hap"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Action" ADD CONSTRAINT "Action_actionType_fkey" FOREIGN KEY ("actionType") REFERENCES "AvailableAction"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Action" ADD CONSTRAINT "Action_hapId_fkey" FOREIGN KEY ("hapId") REFERENCES "Hap"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HapRun" ADD CONSTRAINT "HapRun_hapId_fkey" FOREIGN KEY ("hapId") REFERENCES "Hap"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HapRunOutbox" ADD CONSTRAINT "HapRunOutbox_hapRunId_fkey" FOREIGN KEY ("hapRunId") REFERENCES "HapRun"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
