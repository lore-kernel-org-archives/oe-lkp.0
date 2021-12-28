Content-Type: multipart/mixed; boundary="===============8442744041038396868=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [genirq/msi] 495c66aca3: BUG:sleeping_function_called_from_invalid_context_at_kernel/locking/mutex.c
Date: Tue, 28 Dec 2021 19:40:07 +0100
Message-ID: <87czlgd14o.ffs@tglx>
In-Reply-To: <20211227150535.GA16252@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8442744041038396868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 27 2021 at 23:05, kernel test robot wrote:
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 495c66aca3da704e063fa373fdbe371e71d3f4ee ("genirq/msi: Convert to=
 new functions")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git irq/msi
> kern  :err   : [  126.209306] BUG: sleeping function called from invalid =
context at kernel/locking/mutex.c:280
> kern  :err   : [  126.209308] in_atomic(): 1, irqs_disabled(): 1, non_blo=
ck: 0, pid: 5183, name: ls
> kern  :err   : [  126.209311] preempt_count: 2, expected: 0
> kern  :warn  : [  126.209312] CPU: 2 PID: 5183 Comm: ls Not tainted 5.16.=
0-rc5-00091-g495c66aca3da #1
> kern  :warn  : [  126.209315] Hardware name: Hewlett-Packard HP Pro 3340 =
MT/17A1, BIOS 8.07 01/24/2013
> kern  :warn  : [  126.209316] Call Trace:
> kern  :warn  : [  126.209318]  <TASK>
> kern :warn : [  126.209319] dump_stack_lvl (lib/dump_stack.c:107) =

> kern :warn : [  126.209323] __might_resched.cold (kernel/sched/core.c:953=
9 kernel/sched/core.c:9492) =

> kern :warn : [  126.209326] ? kasan_unpoison (mm/kasan/shadow.c:108 mm/ka=
san/shadow.c:142) =

> kern :warn : [  126.209330] mutex_lock (kernel/locking/mutex.c:280) =

> kern :warn : [  126.209335] ? __mutex_lock_slowpath (kernel/locking/mutex=
.c:279) =

> kern :warn : [  126.209339] ? _raw_spin_lock_irqsave (arch/x86/include/as=
m/atomic.h:202 include/linux/atomic/atomic-instrumented.h:513 include/asm-g=
eneric/qspinlock.h:82 include/linux/spinlock.h:185 include/linux/spinlock_a=
pi_smp.h:111 kernel/locking/spinlock.c:162) =

> kern :warn : [  126.209342] ? _raw_read_unlock_irqrestore (kernel/locking=
/spinlock.c:161) =

> kern :warn : [  126.209344] msi_get_virq (kernel/irq/msi.c:332) =

> kern :warn : [  126.209349] pci_irq_vector (drivers/pci/msi/msi.c:1085 dr=
ivers/pci/msi/msi.c:1077) =

> kern :warn : [  126.209354] rtl8169_netpoll (drivers/net/ethernet/realtek=
/r8169_main.c:4722) =

> kern :warn : [  126.209358] netpoll_poll_dev (net/core/netpoll.c:166 net/=
core/netpoll.c:195) =

> kern :warn : [  126.209363] netpoll_send_skb (net/core/netpoll.c:350 net/=
core/netpoll.c:376) =

> kern :warn : [  126.209367] write_msg (drivers/net/netconsole.c:862 drive=
rs/net/netconsole.c:836) netconsole

Fix below.

Thanks,

        tglx
---
 drivers/net/ethernet/realtek/r8169_main.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -615,6 +615,7 @@ struct rtl8169_private {
 	struct ring_info tx_skb[NUM_TX_DESC];	/* Tx data buffers */
 	u16 cp_cmd;
 	u32 irq_mask;
+	int irq;
 	struct clk *clk;
 =

 	struct {
@@ -4698,7 +4699,7 @@ static int rtl8169_close(struct net_devi
 =

 	cancel_work_sync(&tp->wk.work);
 =

-	free_irq(pci_irq_vector(pdev, 0), tp);
+	free_irq(tp->irq, tp);
 =

 	phy_disconnect(tp->phydev);
 =

@@ -4719,7 +4720,7 @@ static void rtl8169_netpoll(struct net_d
 {
 	struct rtl8169_private *tp =3D netdev_priv(dev);
 =

-	rtl8169_interrupt(pci_irq_vector(tp->pci_dev, 0), tp);
+	rtl8169_interrupt(tp->irq, tp);
 }
 #endif
 =

@@ -4753,8 +4754,7 @@ static int rtl_open(struct net_device *d
 	rtl_request_firmware(tp);
 =

 	irqflags =3D pci_dev_msi_enabled(pdev) ? IRQF_NO_THREAD : IRQF_SHARED;
-	retval =3D request_irq(pci_irq_vector(pdev, 0), rtl8169_interrupt,
-			     irqflags, dev->name, tp);
+	retval =3D request_irq(tp->irq, rtl8169_interrupt, irqflags, dev->name, t=
p);
 	if (retval < 0)
 		goto err_release_fw_2;
 =

@@ -4771,7 +4771,7 @@ static int rtl_open(struct net_device *d
 	return retval;
 =

 err_free_irq:
-	free_irq(pci_irq_vector(pdev, 0), tp);
+	free_irq(tp->irq, tp);
 err_release_fw_2:
 	rtl_release_firmware(tp);
 	rtl8169_rx_clear(tp);
@@ -5341,6 +5341,7 @@ static int rtl_init_one(struct pci_dev *
 		dev_err(&pdev->dev, "Can't allocate interrupt\n");
 		return rc;
 	}
+	tp->irq =3D pci_irq_vector(pdev, 0);
 =

 	INIT_WORK(&tp->wk.work, rtl_task);
 =

@@ -5416,8 +5417,7 @@ static int rtl_init_one(struct pci_dev *
 		return rc;
 =

 	netdev_info(dev, "%s, %pM, XID %03x, IRQ %d\n",
-		    rtl_chip_infos[chipset].name, dev->dev_addr, xid,
-		    pci_irq_vector(pdev, 0));
+		    rtl_chip_infos[chipset].name, dev->dev_addr, xid, tp->irq);
 =

 	if (jumbo_max)
 		netdev_info(dev, "jumbo features [frames: %d bytes, tx checksumming: %s]=
\n",
--===============8442744041038396868==--

