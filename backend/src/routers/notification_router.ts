import { Router } from 'express';
import {
  createNotification,
  getAllNotifications,
  getNotificationById,
  updateNotification,
  deleteNotification,
} from '../controllers/notification_controller/notification_controller.ts';

const router = Router();

router.post('/', createNotification);
router.get('/', getAllNotifications);
router.get('/:id', getNotificationById);
router.put('/:id', updateNotification);
router.delete('/:id', deleteNotification);

export default router;
