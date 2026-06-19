import type { Request, Response } from 'express';
import { prisma } from '../../prisma.ts';

export const createItem = async (req: Request, resp: Response) => {
  const { itemname, sku, quantity, minStock, supplierId, rfidCode } = req.body;
  const item = await prisma.item.create({
    data: {
      itemname,
      sku,
      quantity,
      minStock: minStock ?? 30,
      supplierId,
      rfidCode,
    },
  });
  resp.json(item);
};

export const getAllItems = async (req: Request, resp: Response) => {
  const items = await prisma.item.findMany();
  resp.json(items);
};

export const getItemById = async (req: Request, resp: Response) => {
  const itemId = Number(req.params.id);
  if (Number.isNaN(itemId)) {
    resp.status(400).json({ error: 'Invalid item ID' });
    return;
  }

  const item = await prisma.item.findUnique({
    where: { itemId },
  });

  if (!item) {
    resp.status(404).json({ error: 'Item not found' });
    return;
  }

  resp.json(item);
};

export const updateItem = async (req: Request, resp: Response) => {
  const itemId = Number(req.params.id);
  if (Number.isNaN(itemId)) {
    resp.status(400).json({ error: 'Invalid item ID' });
    return;
  }

  const { itemname, sku, quantity, minStock, supplierId, rfidCode } = req.body;

  const item = await prisma.item.update({
    where: { itemId },
    data: {
      itemname,
      sku,
      quantity,
      minStock,
      supplierId,
      rfidCode,
    },
  });

  resp.json(item);
};

export const adjustItemQuantity = async (req: Request, resp: Response) => {
  const itemId = Number(req.params.id);
  if (Number.isNaN(itemId)) {
    resp.status(400).json({ error: 'Invalid item ID' });
    return;
  }

  const { delta } = req.body;
  if (typeof delta !== 'number' || Number.isNaN(delta)) {
    resp.status(400).json({ error: 'Invalid quantity delta' });
    return;
  }

  const currentItem = await prisma.item.findUnique({
    where: { itemId },
  });

  if (!currentItem) {
    resp.status(404).json({ error: 'Item not found' });
    return;
  }

  const updatedItem = await prisma.item.update({
    where: { itemId },
    data: {
      quantity: currentItem.quantity + delta,
    },
  });

  resp.json(updatedItem);
};

export const deleteItem = async (req: Request, resp: Response) => {
  const itemId = Number(req.params.id);
  if (Number.isNaN(itemId)) {
    resp.status(400).json({ error: 'Invalid item ID' });
    return;
  }

  await prisma.item.delete({
    where: { itemId },
  });

  resp.json({ message: 'Item deleted successfully' });
};
