Content-Type: multipart/mixed; boundary="===============0052722127710683382=="
MIME-Version: 1.0
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: lkp@lists.01.org
Subject: Re: [slab] a1fd55538c: WARNING: CPU: 0 PID: 0 at kernel/locking/lockdep.c:2601 trace_hardirqs_on_caller()
Date: Sat, 30 Jan 2016 18:46:46 +0100
Message-ID: <20160130184646.6ea9c5f8@redhat.com>
In-Reply-To: <21684.1454137770@turing-police.cc.vt.edu>
List-Id: <oe-lkp.lists.linux.dev>

--===============0052722127710683382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 30 Jan 2016 02:09:30 -0500
Valdis.Kletnieks(a)vt.edu wrote:

> On Thu, 28 Jan 2016 18:47:49 +0100, Jesper Dangaard Brouer said:
> > I cannot reproduce below problem... have enabled all kind of debugging
> > and also lockdep.
> >
> > Can I get a version of the .config file used?  =

> =

> I'm not the 0day bot, but my laptop hits the same issue at boot.

Thank you! I'm now able to reproduce, and I've found the issue. It only
happens for SLAB, and with FAILSLAB disabled.

The problem were introduced in the patch before:
  http://ozlabs.org/~akpm/mmots/broken-out/mm-fault-inject-take-over-bootst=
rap-kmem_cache-check.patch
which moved the check function:

 static bool slab_should_failslab(struct kmem_cache *cachep, gfp_t flags)
 {
       if (unlikely(cachep =3D=3D kmem_cache))
               return false;

       return should_failslab(cachep->object_size, flags, cachep->flags);
 }

into the fault injection framework, call of should_failslab().

That change was wrong, as some very early boot code depend on SLAB
failing, when still allocating from the bootstrap kmem_cache. SLUB seem
to handle this better.


In this case the percpu system, have a workqueue function, calling
pcpu_extend_area_map() which sort-of probe the slab-allocator, and
depending on it fails, until it is fully ready.

I will fix up my patches, reverting this change... and let them go
through Andrews quilt process.

Let me know, if the linux-next tree need's an explicit fix?

-- =

Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  Author of http://www.iptv-analyzer.org
  LinkedIn: http://www.linkedin.com/in/brouer

--===============0052722127710683382==--

