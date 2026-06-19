
import type { Express } from 'express';
import express from 'express';
import cors from 'cors';
import auths_router from './routers/auths_router.ts';
import items_router from './routers/items_router.ts';
import inventory_router from './routers/inventory_router.ts';
import notification_router from './routers/notification_router.ts';
import PO_router from './routers/PO_router.ts';
import supplier_router from './routers/supplier_router.ts';
import tag_router from './routers/tag_router.ts';
import dotenv from 'dotenv';

// Load environment variables
dotenv.config();





const app: Express = express();
const port = process.env.PORT || 3000;

// Enable Cross-Origin Resource Sharing
app.use(cors());

// Parse incoming JSON requests
app.use(express.json());

app.use('/auths', auths_router);
app.use('/items', items_router);
app.use('/inventory', inventory_router);
app.use('/notifications', notification_router);
app.use('/purchase-orders', PO_router);
app.use('/suppliers', supplier_router);
app.use('/tags', tag_router);

// Start listening for connections
app.listen(port, () => {
  console.log(`[server]: Server is running at http://localhost:${port}`);
});
