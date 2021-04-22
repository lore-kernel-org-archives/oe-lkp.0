Content-Type: multipart/mixed; boundary="===============8882434912229178979=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [signal] 4bad58ebc8: will-it-scale.per_thread_ops -3.3% regression
Date: Thu, 22 Apr 2021 17:37:18 +0200
Message-ID: <87eef2xrdd.ffs@nanos.tec.linutronix.de>
In-Reply-To: <20210422060213.GC31382@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8882434912229178979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Oliver,

On Thu, Apr 22 2021 at 14:02, Oliver Sang wrote:
> On Tue, Apr 20, 2021 at 08:35:06PM +0200, Thomas Gleixner wrote:
>> Confused.
>
> FYI.
> we re-test this, and confirmed the regression persistent. still:
>
> 69995ebbb9d37173 4bad58ebc8bc4f20d89cff95417
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>  1.271e+09            -3.3%  1.229e+09        will-it-scale.192.threads
>    6620228            -3.3%    6401749        will-it-scale.per_thread_ops
>  1.271e+09            -3.3%  1.229e+09        will-it-scale.workload

I'll have a look.
--===============8882434912229178979==--

