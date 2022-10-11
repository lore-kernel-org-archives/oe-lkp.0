Content-Type: multipart/mixed; boundary="===============1380923671469295645=="
MIME-Version: 1.0
From: Yury Norov <yury.norov@gmail.com>
To: lkp@lists.01.org
Subject: Re: [oliver.sang@intel.com: [cpumask] b9a7ecc71f: WARNING:at_include/linux/cpumask.h:#__is_kernel_percpu_address]
Date: Tue, 11 Oct 2022 10:23:27 -0700
Message-ID: <Y0Wmj+XnyD/c6XM3@yury-laptop>
In-Reply-To: <Y0Wk0WD6CL4aFEIi@yury-laptop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1380923671469295645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2022 at 10:16:03AM -0700, Yury Norov wrote:
> > Hi Yury,
> > =

> > I just wanted to report that the warning fires when doing
> > 'cat /proc/cpuinfo' on at least x86 and riscv. I don't think
> > those are false positives. I'm guessing a patch should be
> > something like the following diff. If you haven't already
> > addressed this and I'm not off in left field, then I guess
> > we should integrate it into your series.
> > =

> > Thanks,
> > drew
>  =

> Hi Andrew,
> =

> Can you please send it as a patch with a description?

Also, can you describe why we'd silence the warning this way?
If the cpu number greater than nr_cpu_ids comes from upper layer,
we quite probably should investigate what happens there...

Thanks,
Yury
--===============1380923671469295645==--

