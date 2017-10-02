import { Answer } from './answer';

export class Question {
  id: number
  exam_id: number
  number: number
  text: string
  answers: Answer[]
  created_at: Date
  updated_at: Date
}
