Content-Type: multipart/mixed; boundary="===============7960984272497662896=="
MIME-Version: 1.0
From: Joonsoo Kim <iamjoonsoo.kim@lge.com>
To: lkp@lists.01.org
Subject: Re: [mm] INFO: rcu_sched detected stalls on CPUs/tasks: { 1} (detected by 0, t=10002 jiffies, g=945, c=944, q=0)
Date: Mon, 15 Dec 2014 16:28:05 +0900
Message-ID: <20141215072804.GA4898@js1304-P5Q-DELUXE>
In-Reply-To: <1418284830.5745.72.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7960984272497662896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2014 at 04:00:30PM +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
> commit 6a7d22008b2294f1dacbc77632a26f2142f2d4b0 ("mm: Fix boot crash with=
 f7426b983a6a ("mm: cma: adjust address limit to avoid hitting low/high mem=
ory boundary")")
> =

> The original boot failures are fixed, but there are some boot hang now.
> Sometimes because of OOM for trinity test.

CCing relevant people.

Hmm... My fix is just work-around to avoid validation when VA to PA
conversion. So, it would be irrelevant to this problem. Blaming
original patch makes more sense to me.

Anyway, I looked at the original commit f7426b983a6a and found that
it doesn't have any effect after reserving CMA region. Attached dmesg
say that reservation is successful. So I wonder what cause this stall.
Could you share your config to help debug?

And, dmesg log also say that 16 MB is reserved for CMA. Is there any
possibility this memory reservation cause this stall? Possibly, your
OOM report is related to this reservation.

Thanks.


--===============7960984272497662896==--

