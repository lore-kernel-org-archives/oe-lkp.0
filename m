Content-Type: multipart/mixed; boundary="===============7304012111801692739=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: 38896483e1 ("perf: Use min_heap in visit_groups_merge()"): WARNING: CPU: 1 PID: 381 at include/linux/min_heap.h:84 visit_groups_merge
Date: Wed, 26 Feb 2020 14:17:46 +0100
Message-ID: <20200226131746.GW18400@hirez.programming.kicks-ass.net>
In-Reply-To: <5e51a363.CtrRArFyMY4C/WIy%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7304012111801692739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> [   20.990308] ------------[ cut here ]------------
> [   20.991091] Popping an empty heap

Duh, fixed.
--===============7304012111801692739==--

