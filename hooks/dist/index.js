"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const app = (0, express_1.default)();
app.use(express_1.default.json());
app.get("/", (req, res) => {
    console.log("reached here");
    res.json({ message: "hello world" });
});
app.post("/api/webhooks/:userId/:hapId", (req, res) => {
    const userId = req.params.userId;
    const hapId = req.params.hapId;
    console.log(hapId, userId);
    return res.json({ hapId, userId });
});
app.listen(3001, () => {
    console.log("Server is running");
});
