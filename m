Content-Type: multipart/mixed; boundary="===============1531135289343329820=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/hweight] 65ea11ec6a: will-it-scale.per_process_ops 9.3% improvement
Date: Thu, 25 Aug 2016 13:45:06 +0200
Message-ID: <20160825114506.GA11762@nazgul.tnic>
In-Reply-To: <D6903D5A-D2CA-4FAB-8D3E-5885B8F79AED@zytor.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1531135289343329820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2016 at 03:05:19AM -0700, H. Peter Anvin wrote:
> I'm wondering if one of those 23 invocations sets up some kind of
> corrupt data that continues to get used.

That could be one plausible explanation. Look at what calls
__sw_hweight64:

initmem_init
numa_policy_init
page_writeback_init
paging_init
pcpu_embed_first_chunk
pcpu_setup_first_chunk
sched_init
set_rq_online.part.46
setup_arch
setup_per_cpu_areas
update_sysctl
x86_64_start_kernel
x86_64_start_reservations
x86_numa_init
zone_sizes_init

I could very well imagine per CPU areas or some sched structure or
whatever getting silently corrupted.

Thanks.

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--

--===============1531135289343329820==--

