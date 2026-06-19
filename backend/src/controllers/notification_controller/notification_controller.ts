import type { Request, Response } from 'express';
import { prisma } from '../../prisma.ts';

export const createNotification = async (req: Request, resp: Response) => {
  const { title, message, type, isRead } = req.body;
  const notification = await prisma.notification.create({
    data: {
      title,
      message,
      type,
      isRead,
    },
  });
  resp.json(notification);
};

export const getAllNotifications = async (req: Request, resp: Response) => {
  const notifications = await prisma.notification.findMany();
  resp.json(notifications);
};

export const getNotificationById = async (req: Request, resp: Response) => {
  const notid = Number(req.params.id);
  if (Number.isNaN(notid)) {
    resp.status(400).json({ error: 'Invalid notification ID' });
    return;
  }

  const notification = await prisma.notification.findUnique({
    where: { notid },
  });

  if (!notification) {
    resp.status(404).json({ error: 'Notification not found' });
    return;
  }

  resp.json(notification);
};

export const updateNotification = async (req: Request, resp: Response) => {
  const notid = Number(req.params.id);
  if (Number.isNaN(notid)) {
    resp.status(400).json({ error: 'Invalid notification ID' });
    return;
  }

  const { title, message, type, isRead } = req.body;
  const notification = await prisma.notification.update({
    where: { notid },
    data: {
      title,
      message,
      type,
      isRead,
    },
  });

  resp.json(notification);
};

export const deleteNotification = async (req: Request, resp: Response) => {
  const notid = Number(req.params.id);
  if (Number.isNaN(notid)) {
    resp.status(400).json({ error: 'Invalid notification ID' });
    return;
  }

  await prisma.notification.delete({
    where: { notid },
  });

  resp.json({ message: 'Notification deleted successfully' });
};
