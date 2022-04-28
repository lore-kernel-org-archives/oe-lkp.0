Content-Type: multipart/mixed; boundary="===============1727980464821182903=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [memcg] a8c49af3be: hackbench.throughput -13.7% regression
Date: Thu, 28 Apr 2022 13:12:08 +0800
Message-ID: <54bcab1b-2c39-9052-2bc4-4a779fe7b27a@intel.com>
In-Reply-To: <CALvZod4_vNWYxzGR3BksZYgoti-9hOioMGwF2UVRnwcAGpFqXA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1727980464821182903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Shakeel,

On 4/27/2022 1:02 PM, Shakeel Butt wrote:
> Can you to comment out the following block instead of the above line
> and see if there is any impact?

Changed the code as following:

+static void memcg_account_kmem(struct mem_cgroup *memcg, int nr_pages)
+{
+       mod_memcg_state(memcg, MEMCG_KMEM, nr_pages);
+
+#if    0
+       if (!cgroup_subsys_on_dfl(memory_cgrp_subsys)) {
+               if (nr_pages > 0)
+                       page_counter_charge(&memcg->kmem, nr_pages);
+               else
+                       page_counter_uncharge(&memcg->kmem, -nr_pages);
+       }
+#endif
+}
+

The hackbench test result is 147% better:

086f694a75e1a283 cee08cab8eefaaffdec62343e8d
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
       8691:15      -52942%         750:6     dmesg.timestamp:last
           :15          13%           2:6     last_state.booting
           :15          13%           2:6     last_state.is_incomplete_run
          1:15          -7%            :6     kmsg.common_interrupt:#No_irq=
_handler_for_vector
          2:15         -18%            :6     kmsg.timestamp:common_interru=
pt:#No_irq_handler_for_vector
       4656:15      -26039%         750:6     kmsg.timestamp:last
         %stddev     %change         %stddev
             \          |                \
    143619 =C2=B1  4%    +147.0%     354807 =C2=B1  2%  hackbench.throughpu=
t   <------
    475.91 =C2=B1  4%     -58.8%     196.09 =C2=B1  2%  hackbench.time.elap=
sed_time


Regards
Yin, Fengwei
--===============1727980464821182903==--

