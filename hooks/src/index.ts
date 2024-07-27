import express, { Request, Response } from "express";

const app = express();

app.use(express.json());

app.get("/", (req, res)=>{
    console.log("reached here");
    res.json({ message: "hello world"});
})
app.post("/api/webhooks/:userId/:hapId", (req: Request, res: Response) => { 
  const userId = req.params.userId;
  const hapId = req.params.hapId;

  console.log(hapId, userId);
  return res.json({hapId, userId})
});

app.listen(3001, ()=>{
    console.log("Server is running")
});
