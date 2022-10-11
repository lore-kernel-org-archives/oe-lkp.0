Content-Type: multipart/mixed; boundary="===============6248484512814504647=="
MIME-Version: 1.0
From: Andrew Jones <ajones@ventanamicro.com>
To: lkp@lists.01.org
Subject: Re: [oliver.sang@intel.com: [cpumask] b9a7ecc71f: WARNING:at_include/linux/cpumask.h:#__is_kernel_percpu_address]
Date: Tue, 11 Oct 2022 20:04:42 +0200
Message-ID: <20221011180442.cwjtcvjioias3qt6@kamzik>
In-Reply-To: <Y0Wmj+XnyD/c6XM3@yury-laptop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6248484512814504647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2022 at 10:23:27AM -0700, Yury Norov wrote:
> On Tue, Oct 11, 2022 at 10:16:03AM -0700, Yury Norov wrote:
> > > Hi Yury,
> > > =

> > > I just wanted to report that the warning fires when doing
> > > 'cat /proc/cpuinfo' on at least x86 and riscv. I don't think
> > > those are false positives. I'm guessing a patch should be
> > > something like the following diff. If you haven't already
> > > addressed this and I'm not off in left field, then I guess
> > > we should integrate it into your series.
> > > =

> > > Thanks,
> > > drew
> >  =

> > Hi Andrew,
> > =

> > Can you please send it as a patch with a description?
> =

> Also, can you describe why we'd silence the warning this way?
> If the cpu number greater than nr_cpu_ids comes from upper layer,
> we quite probably should investigate what happens there...

Darn, I fired off the patches before reading this. I didn't try to
completely digest seq_read_iter(), but on a quick look I think the
reason is that it implements something like

  p =3D start();
  while (1) {
     p =3D next();
     if (!p)
         break;
     show();
  }
  stop();

where cpuinfo's operators are

 start()
 {
    *pos =3D cpumask_next(*pos - 1, cpu_online_mask);
    if (*pos < nr_cpu_ids)
        return ...;
    return NULL;
 }

 next()
 {
   (*pos)++;
   return start(..., pos);
 }

So the justification for the patches the way I've written them is
that I think we just need to return NULL from start / next when
we've gone too far, before we first warn and then return NULL.

Thanks,
drew
--===============6248484512814504647==--

