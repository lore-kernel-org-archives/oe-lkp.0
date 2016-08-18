Content-Type: multipart/mixed; boundary="===============6854006937630527887=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/hweight] 65ea11ec6a: will-it-scale.per_process_ops 9.3% improvement
Date: Thu, 18 Aug 2016 05:45:13 +0200
Message-ID: <20160818034513.GA21415@nazgul.tnic>
In-Reply-To: <87r39n58sv.fsf@yhuang-mobile.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6854006937630527887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2016 at 03:29:04PM -0700, Huang, Ying wrote:
> branch-miss-rate decreased from ~0.30% to ~0.043%.
> =

> So I guess there are some code alignment change, which caused decreased
> branch miss rate.

Hrrm, I still can't imagine how that would happen if the machine
supports POPCNT and we never call the __sw_hweight* variants. Or does
it?

Can you paste /proc/cpuinfo from that Sandy Bridge-EP box?

Thanks.

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--

--===============6854006937630527887==--

