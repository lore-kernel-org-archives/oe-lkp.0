Content-Type: multipart/mixed; boundary="===============2390036654168668353=="
MIME-Version: 1.0
From: Barry Song <21cnbao@gmail.com>
To: lkp@lists.01.org
Subject: Re: [PCI/MSI] a4fc4cf388: dmesg.genirq:Flags_mismatch_irq##(mei_me)vs.#(xhci_hcd)
Date: Sat, 16 Oct 2021 13:08:43 +1300
Message-ID: <CAGsJ_4z9mXW25b-5b6ChAFWytSxQ5Ya2+B3mVy8hhGBPVMzHbw@mail.gmail.com>
In-Reply-To: <20211015144528.GA21175@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2390036654168668353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 16, 2021 at 3:46 AM Carel Si <beibei.si@intel.com> wrote:
>
> Hi, Barry
>
> On Sun, Oct 03, 2021 at 04:32:28PM +0800, Barry Song wrote:
> > On Fri, Sep 3, 2021 at 7:34 AM Winkler, Tomas <tomas.winkler@intel.co=
m> wrote:
> > >
> > > > dmesg.genirq:Flags_mismatch_irq##(mei_me)vs.#(xhci_hcd)
> > > >
> > > > On Tue, Aug 31, 2021 at 1:21 PM Barry Song <21cnbao@gmail.com> wr=
ote:
> > > > >
> > > > > On Mon, Aug 30, 2021 at 2:38 AM kernel test robot
> > > > <oliver.sang@intel.com> wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > Greeting,
> > > > > >
> > > > > > FYI, we noticed the following commit (built with gcc-9):
> > > > > >
> > > > > > commit: a4fc4cf388319ea957ffbdab5073bdd267de9082 ("[PATCH v3 3/=
3]
> > > > > > PCI/MSI: remove msi_attrib.default_irq in msi_desc")
> > > > > > url:
> > > > > > https://github.com/0day-ci/linux/commits/Barry-Song/PCI-MSI-Cla=
rify-
> > > > > > the-IRQ-sysfs-ABI-for-PCI-devices/20210825-183018
> > > > > > base:
> > > > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
> > > > > > 6e764bcd1cf72a2846c0e53d3975a09b242c04c9
> > > > > >
> > > > > > in testcase: kernel-selftests
> > > > > > version: kernel-selftests-x86_64-ebaa603b-1_20210825
> > > > > > with following parameters:
> > > > > >
> > > > > >         group: pidfd
> > > > > >         ucode: 0xe2
> > > > > >
> > > > > > test-description: The kernel contains a set of "self tests" und=
er the
> > > > tools/testing/selftests/ directory. These are intended to be small =
unit tests
> > > > to exercise individual code paths in the kernel.
> > > > > > test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> > > > > >
> > > > > >
> > > > > > on test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20=
GHz
> > > > > > with 32G memory
> > > > > >
> > > > > > caused below changes (please refer to attached dmesg/kmsg for e=
ntire
> > > > log/backtrace):
> > > > > >
> > > > > >
> > > > > >
> > > > > > If you fix the issue, kindly add following tag
> > > > > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > >
> > > > > >
> > > > > >
> > > > > > [  179.602028][   T34] genirq: Flags mismatch irq 16. 00002000 =
(mei_me) vs.
> > > > 00000000 (xhci_hcd)
> > > > > > [  179.614073][   T34] CPU: 2 PID: 34 Comm: kworker/u8:2 Not ta=
inted
> > > > 5.14.0-rc7-00014-ga4fc4cf38831 #1
> > > > > > [  179.623225][   T34] Hardware name: Dell Inc. OptiPlex 7040/0=
Y7WYT,
> > > > BIOS 1.8.1 12/05/2017
> > > > > > [  179.631432][   T34] Workqueue: events_unbound async_run_entr=
y_fn
> > > > > > [  179.637543][   T34] Call Trace:
> > > > > > [  179.640789][   T34]  dump_stack_lvl+0x45/0x59
> > > > > > [  179.645253][   T34]  __setup_irq.cold+0x50/0xd4
> > > > > > [  179.649893][   T34]  ? mei_me_pg_exit_sync+0x480/0x480 [mei_=
me]
> > > > > > [  179.655923][   T34]  request_threaded_irq+0x10c/0x180
> > > > > > [  179.661073][   T34]  ? mei_me_irq_quick_handler+0x240/0x240
> > > > [mei_me]
> > > > > > [  179.667528][   T34]  mei_me_probe+0x131/0x300 [mei_me]
> > > > > > [  179.672767][   T34]  local_pci_probe+0x42/0x80
> > > > > > [  179.677313][   T34]  pci_device_probe+0x107/0x1c0
> > > > > > [  179.682118][   T34]  really_probe+0xb6/0x380
> > > > > > [  179.687094][   T34]  __driver_probe_device+0xfe/0x180
> > > > > > [  179.692242][   T34]  driver_probe_device+0x1e/0xc0
> > > > > > [  179.697133][   T34]  __driver_attach_async_helper+0x2b/0x80
> > > > > > [  179.702802][   T34]  async_run_entry_fn+0x30/0x140
> > > > > > [  179.707693][   T34]  process_one_work+0x274/0x5c0
> > > > > > [  179.712503][   T34]  worker_thread+0x50/0x3c0
> > > > > > [  179.716959][   T34]  ? process_one_work+0x5c0/0x5c0
> > > > > > [  179.721936][   T34]  kthread+0x14f/0x180
> > > > > > [  179.725958][   T34]  ? set_kthread_struct+0x40/0x40
> > > > > > [  179.730935][   T34]  ret_from_fork+0x22/0x30
> > > > > > [  179.735699][   T34] mei_me 0000:00:16.0: request_threaded_ir=
q failure.
> > > > irq =3D 16
> > > > > > [  179.743125][   T34] mei_me 0000:00:16.0: initialization fail=
ed.
> > > > > > [  179.749399][   T34] mei_me: probe of 0000:00:16.0 failed wit=
h error -16
> > > > > >
> > > > > >
> > > > >
> > > > > it seems there is a direct reference to pdev->irq.
> > > > > Hi Oliver, would you try if the below patch can fix the problem:
> > > >
> > > > + Tomas
> > > >
> > > > sorry. after second looking, drivers/misc/mei/pci-me.c has many pla=
ces using
> > > > pdev->irq directly. We really need this driver's maintainers to add=
ress the
> > > > problem.
> > >
> > > Will look at that.
> >
> > Hi Tomas,
> >
> > I assume using hw->irq or not is a separate topic, does vim command
> > %s/pdev->irq/pci_irq_vector(pdev, 0)/g
> > as below fix the current crash problem because of directly dereferencing
> > pdev->irq?
>
> We tested your fix, it can solve "Flags_mismatch_irq##(mei_me)vs.#(xhci_h=
cd)"

thanks for your test and update.

> issue, but it still has "Flags_mismatch_irq##(i915)vs.#(xhci_hcd)" and

Can you post the backtrace of i915?

> "Flags_mismatch_irq##(i801_smbus)vs.#(xhci_hcd)" issue, could you help on=
 them?

I assume the below can fix i801_smbus:

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 89ae78ef1a1c..88d96e3ca268 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1827,7 +1827,7 @@ static int i801_probe(struct pci_dev *dev, const
struct pci_device_id *id)
        /* Default timeout in interrupt mode: 200 ms */
        priv->adapter.timeout =3D HZ / 5;

-       if (dev->irq =3D=3D IRQ_NOTCONNECTED)
+       if (pci_irq_vector(dev, 0) =3D=3D IRQ_NOTCONNECTED)
                priv->features &=3D ~FEATURE_IRQ;

        if (priv->features & FEATURE_IRQ) {
@@ -1849,11 +1849,11 @@ static int i801_probe(struct pci_dev *dev,
const struct pci_device_id *id)
        if (priv->features & FEATURE_IRQ) {
                init_completion(&priv->done);

-               err =3D devm_request_irq(&dev->dev, dev->irq, i801_isr,
+               err =3D devm_request_irq(&dev->dev, pci_irq_vector(dev,
0), i801_isr,
                                       IRQF_SHARED, DRV_NAME, priv);
                if (err) {
                        dev_err(&dev->dev, "Failed to allocate irq %d: %d\n=
",
-                               dev->irq, err);
+                               pci_irq_vector(dev, 0), err);
                        priv->features &=3D ~FEATURE_IRQ;
                }
        }



> thanks!
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/group/kconfig/rootfs/tbox_group/testcase/ucode:
>   gcc-9/pidfd/x86_64-rhel-8.3-kselftests/debian-10.4-x86_64-20200603.cgz/=
lkp-skl-d05/kernel-selftests/0xe2
>
> commit:
>   86c19983f1 ("PCI/sysfs: Don't depend on pci_dev.irq for IRQ entry")   <=
<< parent
>   a4fc4cf388 ("PCI/MSI: remove msi_attrib.default_irq in msi_desc")     <=
<< fbc
>   29368adf4c ("fixup-for-a4fc4cf388")
>
> 86c19983f1808cea a4fc4cf388319ea957ffbdab507 29368adf4c2b598c3e13dbd9603
> ---------------- --------------------------- ---------------------------
>        fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
>            |             |             |             |             |
>            :31          68%          21:31          71%          22:31   =
 dmesg.genirq:Flags_mismatch_irq##(i801_smbus)vs.#(xhci_hcd)
>            :31          84%          26:31          94%          29:31   =
 dmesg.genirq:Flags_mismatch_irq##(i915)vs.#(xhci_hcd)
>            :31          77%          24:31           0%            :31   =
 dmesg.genirq:Flags_mismatch_irq##(mei_me)vs.#(xhci_hcd)
>
> >
> > diff --git a/drivers/misc/mei/pci-me.c b/drivers/misc/mei/pci-me.c
> > index c3393b383e59..97495931fadd 100644
> > --- a/drivers/misc/mei/pci-me.c
> > +++ b/drivers/misc/mei/pci-me.c
> > @@ -216,18 +216,18 @@ static int mei_me_probe(struct pci_dev *pdev,
> > const struct pci_device_id *ent)
> >
> >   pci_enable_msi(pdev);
> >
> > - hw->irq =3D pdev->irq;
> > + hw->irq =3D pci_irq_vector(pdev, 0);
> >
> >   /* request and enable interrupt */
> >   irqflags =3D pci_dev_msi_enabled(pdev) ? IRQF_ONESHOT : IRQF_SHARED;
> >
> > - err =3D request_threaded_irq(pdev->irq,
> > + err =3D request_threaded_irq(pci_irq_vector(pdev, 0),
> >   mei_me_irq_quick_handler,
> >   mei_me_irq_thread_handler,
> >   irqflags, KBUILD_MODNAME, dev);
> >   if (err) {
> >   dev_err(&pdev->dev, "request_threaded_irq failure. irq =3D %d\n",
> > -        pdev->irq);
> > +        pci_irq_vector(pdev, 0));
> >   goto end;
> >   }
> >
> > @@ -278,7 +278,7 @@ static int mei_me_probe(struct pci_dev *pdev,
> > const struct pci_device_id *ent)
> >  release_irq:
> >   mei_cancel_work(dev);
> >   mei_disable_interrupts(dev);
> > - free_irq(pdev->irq, dev);
> > + free_irq(pci_irq_vector(pdev, 0), dev);
> >  end:
> >   dev_err(&pdev->dev, "initialization failed.\n");
> >   return err;
> > @@ -307,7 +307,7 @@ static void mei_me_shutdown(struct pci_dev *pdev)
> >   mei_me_unset_pm_domain(dev);
> >
> >   mei_disable_interrupts(dev);
> > - free_irq(pdev->irq, dev);
> > + free_irq(pci_irq_vector(pdev, 0), dev);
> >  }
> >
> >  /**
> > @@ -336,7 +336,7 @@ static void mei_me_remove(struct pci_dev *pdev)
> >
> >   mei_disable_interrupts(dev);
> >
> > - free_irq(pdev->irq, dev);
> > + free_irq(pci_irq_vector(pdev, 0), dev);
> >
> >   mei_deregister(dev);
> >  }
> > @@ -356,7 +356,7 @@ static int mei_me_pci_suspend(struct device *device)
> >
> >   mei_disable_interrupts(dev);
> >
> > - free_irq(pdev->irq, dev);
> > + free_irq(pci_irq_vector(pdev, 0), dev);
> >   pci_disable_msi(pdev);
> >
> >   return 0;
> > @@ -378,14 +378,14 @@ static int mei_me_pci_resume(struct device *devic=
e)
> >   irqflags =3D pci_dev_msi_enabled(pdev) ? IRQF_ONESHOT : IRQF_SHARED;
> >
> >   /* request and enable interrupt */
> > - err =3D request_threaded_irq(pdev->irq,
> > + err =3D request_threaded_irq(pci_irq_vector(pdev, 0),
> >   mei_me_irq_quick_handler,
> >   mei_me_irq_thread_handler,
> >   irqflags, KBUILD_MODNAME, dev);
> >
> >   if (err) {
> >   dev_err(&pdev->dev, "request_threaded_irq failed: irq =3D %d.\n",
> > - pdev->irq);
> > + pci_irq_vector(pdev, 0));
> >   return err;
> >   }
> >
> >
> > Thanks
> > barry

Thanks
barry
--===============2390036654168668353==--

