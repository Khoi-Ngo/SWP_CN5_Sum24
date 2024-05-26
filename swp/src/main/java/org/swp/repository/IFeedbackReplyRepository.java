package org.swp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.swp.entity.Shop;
import org.swp.entity.other.FeedbackReply;

public interface IFeedbackReplyRepository extends JpaRepository<FeedbackReply, Long> {
}
