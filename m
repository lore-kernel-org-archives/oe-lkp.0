Content-Type: multipart/mixed; boundary="===============0598039502377959515=="
MIME-Version: 1.0
From: Bart Van Assche <Bart.VanAssche@sandisk.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [block] c4e7d723f3: WARNING:at_block/blk-merge.c:#attempt_merge
Date: Tue, 30 May 2017 15:01:10 +0000
Message-ID: <1496156469.2627.0.camel@sandisk.com>
In-Reply-To: <20170528053325.GA16271@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0598039502377959515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 2017-05-28 at 13:33 +0800, kernel test robot wrote:
> [  207.874416] WARNING: CPU: 0 PID: 419 at block/blk-merge.c:674 attempt_=
merge+0xd1/0x11a6

I will fix this by adding if (!q->mq_ops) in front of the lockdep_assert_he=
ld()
statement in attempt_merge().

Bart.
--===============0598039502377959515==--

