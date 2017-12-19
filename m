Content-Type: multipart/mixed; boundary="===============8174612983222948886=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: WARNING: CPU: 0 PID: 706 at block/blk-mq.c:645 blk_mq_start_request
Date: Tue, 19 Dec 2017 07:20:34 -0800
Message-ID: <20171219152034.GO3919388@devbig577.frc2.facebook.com>
In-Reply-To: <20171218022318.36bmx6y3jsebpgss@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8174612983222948886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello, Fengguang.

On Mon, Dec 18, 2017 at 10:23:18AM +0800, Fengguang Wu wrote:
> Hi Tejun,
> =

> FYI, this commit is not bisect friendly. The problem seems fixed in
> branch HEAD.
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/tj/misc.git blk-mq-timeou=
t-v3
> =

> commit 5c99ca4b1bbda008c89f0e41c4e237dd11acf96e
> Author:     Tejun Heo <tj@kernel.org>
> AuthorDate: Fri Dec 15 08:24:00 2017 -0800
> Commit:     Tejun Heo <tj@kernel.org>
> CommitDate: Fri Dec 15 08:24:00 2017 -0800
> =

>      blk-mq: replace timeout synchronization with a RCU and generation ba=
sed scheme

Yeah, I noticed the problem while trying to send out v3, spent a
couple days fixing it, forced-update the branch and then sent out v4.
I confirmed that the posted patchset and updated v3 branch don't
trigger the warning with the repro.

Thank you very much for the awesome testing.

-- =

tejun

--===============8174612983222948886==--

