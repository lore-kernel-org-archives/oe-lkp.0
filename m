Content-Type: multipart/mixed; boundary="===============3126317937051177911=="
MIME-Version: 1.0
From: Theodore Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: eb9d1bf079 [ 88.881528] EIP: _random_read
Date: Wed, 22 May 2019 12:24:44 -0400
Message-ID: <20190522162444.GB2744@mit.edu>
In-Reply-To: <20190516071405.GO31424@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3126317937051177911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Can you check and see if this addresses the issue?  I'm not able to
easily repro the softlockup.

Thanks!

						- Ted

commit f93d3e94983bf8b4697ceb121c79afd941862860
Author: Theodore Ts'o <tytso@mit.edu>
Date:   Wed May 22 12:02:16 2019 -0400

    random: fix soft lockup when trying to read from an uninitialized block=
ing pool
    =

    Fixes: eb9d1bf079bb: "random: only read from /dev/random after its pool=
 has received 128 bits"
    Reported-by: kernel test robot <lkp@intel.com>
    Signed-off-by: Theodore Ts'o <tytso@mit.edu>

diff --git a/drivers/char/random.c b/drivers/char/random.c
index a42b3d764da8..9cea93d0bfb3 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1936,8 +1936,8 @@ _random_read(int nonblock, char __user *buf, size_t n=
bytes)
 			return -EAGAIN;
 =

 		wait_event_interruptible(random_read_wait,
-			ENTROPY_BITS(&input_pool) >=3D
-			random_read_wakeup_bits);
+		    blocking_pool.initialized &&
+		    (ENTROPY_BITS(&input_pool) >=3D random_read_wakeup_bits));
 		if (signal_pending(current))
 			return -ERESTARTSYS;
 	}

--===============3126317937051177911==--

