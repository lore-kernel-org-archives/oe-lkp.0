Content-Type: multipart/mixed; boundary="===============5426512681742210223=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: [RFC] replace ->get_poll_head with a waitqueue pointer in struct file
Date: Thu, 28 Jun 2018 16:20:53 +0200
Message-ID: <20180628142059.10017-1-hch@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============5426512681742210223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Introducing the new poll methods showed up a regression in the
will-it-scale ltp tests.  One reason for that is that indirect function
calls are very expensive now with the spectre mitigations.  I'm waiting
for better numbers, but this series has shown a 5% improvements in the
ops per second so far, while for the get_poll_head addition we had
regressions of 3.7% or 8.8% depending on the measurement.

This series removes the get_poll_head method again and instead stores an
optional wait_queue_head pointer in struct file, on which the poll_mask
method can be used if it is set.  The only complication is the networking
poll code which not only does some interesting gymnastics to get at the
wait queue pointer, but also has a mode to to hardware polling before
waiting for an even from poll or epoll.  Because of that this series has
a few net prep patches that need careful review.

--===============5426512681742210223==--

