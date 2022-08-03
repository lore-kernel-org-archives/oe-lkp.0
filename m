Content-Type: multipart/mixed; boundary="===============4748950349777844331=="
MIME-Version: 1.0
From: Yin, Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 016a23388c: stress-ng.xattr.ops_per_sec 58.4% improvement
Date: Wed, 03 Aug 2022 22:11:02 +0800
Message-ID: <8b9a5712-fbb1-afdf-6c5b-fa261832665f@intel.com>
In-Reply-To: <20220803010246.GB3600936@dread.disaster.area>
List-Id: <oe-lkp.lists.linux.dev>

--===============4748950349777844331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On 8/3/2022 9:02 AM, Dave Chinner wrote:
> That a single cacheline miss avoids all the spinlock contention is
> just pure luck - it'll come back if other work is being done on the
> machine that consumes enough memory bandwidth to push this back over
> the edge.

Agree. We did see some strange performance boost which can't be connected
to the code change. And worried later unrelated change reduce the
mysterious performance gain (and report it as regression).

Regards
Yin, Fengwei
--===============4748950349777844331==--

