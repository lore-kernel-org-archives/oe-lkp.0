Content-Type: multipart/mixed; boundary="===============3866903057554014940=="
MIME-Version: 1.0
From: Bart Van Assche <bvanassche@acm.org>
To: lkp@lists.01.org
Subject: Re: [block/mq] 2aa18c32fd: WARNING:at_block/mq-deadline-main.c:#dd_insert_requests
Date: Fri, 11 Jun 2021 08:58:28 -0700
Message-ID: <3e58f0b5-3dbe-b38a-ea2f-2399f5a451f5@acm.org>
In-Reply-To: <20210611070434.GA26476@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3866903057554014940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/11/21 12:04 AM, kernel test robot wrote:
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

In the dmesg output I found the following:

kern  :warn  : [  100.174333] WARNING: CPU: 0 PID: 1055 at
block/mq-deadline-main.c:714 dd_insert_requests+0x1b5/0x300
kern  :warn  : [  100.521569] WARNING: CPU: 0 PID: 1055 at
block/mq-deadline-main.c:474 dd_dispatch_request+0x280/0x380

So these warnings are triggered by:

#if defined(CONFIG_BLK_CGROUP)
		WARN_ON_ONCE(true);
#endif

and in both call stacks I found the following: blkdev_issue_discard(). I
will take a closer look.

Bart.
--===============3866903057554014940==--

