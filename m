Content-Type: multipart/mixed; boundary="===============7290106117775431277=="
MIME-Version: 1.0
From: Christoph Lameter <cl@linux.com>
To: lkp@lists.01.org
Subject: Re: [test_power_init] WARNING: CPU: 1 PID: 1 at lib/debugobjects.c:263 debug_print_object()
Date: Thu, 06 Aug 2015 15:40:39 -0500
Message-ID: <alpine.DEB.2.11.1508061533340.8172@east.gentwo.org>
In-Reply-To: <20150806181525.GA15732@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7290106117775431277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Aug 2015, Fengguang Wu wrote:

> [   31.664489] WARNING: CPU: 1 PID: 1 at lib/debugobjects.c:263 debug_pri=
nt_object+0xfe/0x11d()
> [   31.675198] ODEBUG: free active (active state 0) object type: work_str=
uct hint: power_supply_changed_work+0x0/0x1f7

Ok this is slab independent object validation. No idea what this
means. A free of an active object should be ok. Or is the object somehow
tracked in a different way to be active that prevents its freeing? Has a
refcount or so?

> [   31.760114] kernel BUG at mm/slab.c:2291!

Interrupts not disabled as they ought to be.

--===============7290106117775431277==--

