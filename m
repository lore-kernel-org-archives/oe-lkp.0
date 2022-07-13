Content-Type: multipart/mixed; boundary="===============0510154908620917215=="
MIME-Version: 1.0
From: Schspa Shi <schspa@gmail.com>
To: lkp@lists.01.org
Subject: Re: [workqueue] 1a0a67f5ef: phoronix-test-suite.fio.SequentialRead.IO_uring.Yes.No.1MB.DefaultTestDirectory.mb_s -17.7% regression
Date: Wed, 13 Jul 2022 14:09:28 +0800
Message-ID: <m2bkttms3w.fsf@gmail.com>
In-Reply-To: <Ys4zVkJCH04cnSGX@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0510154908620917215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


kernel test robot <oliver.sang@intel.com> writes:

> Greeting,
>
> FYI, we noticed a -17.7% regression of phoronix-test-suite.fio.Sequential=
Read.IO_uring.Yes.No.1MB.DefaultTestDirectory.mb_s due to commit:
>

This performance drop can be fixed by convert to wq_pool_attach_mutex
to a rwsem, or add another lock for this. I will upload a new PATCH
version for this.

-- =

BRs
Schspa Shi
--===============0510154908620917215==--

