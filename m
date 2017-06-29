Content-Type: multipart/mixed; boundary="===============2685726271170843284=="
MIME-Version: 1.0
From: Alan Stern <stern@rowland.harvard.edu>
To: lkp@lists.01.org
Subject: Re: [USB] f16443a034: EIP:arch_local_irq_restore
Date: Thu, 29 Jun 2017 10:51:57 -0400
Message-ID: <Pine.LNX.4.44L0.1706291025260.1571-100000@iolanthe.rowland.org>
In-Reply-To: <20170629024739.GA22535@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2685726271170843284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Felipe:

On Thu, 29 Jun 2017, kernel test robot wrote:

> FYI, we noticed the following commit:
> =

> commit: f16443a034c7aa359ddf6f0f9bc40d01ca31faea ("USB: gadgetfs, dummy-h=
cd, net2280: fix locking for callbacks")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -m 420M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
...

I won't include the entire report.  The gist is that we have a problem =

with lock ordering.  The report is about dummy-hcd, but this could =

affect any UDC driver.

     1. When a SETUP request arrives, composite_setup() acquires
	cdev->lock before calling the function driver's callback.
	When that callback submits a reply, it causes the UDC driver
	to acquire its private lock.

     2. When a bus reset occurs, the UDC's interrupt handler acquires
	its private lock before calling usb_gadget_udc_reset(), which
	calls composite_disconnect(), which acquires cdev->lock.

So there's an ABBA ordering problem between the UDC's private lock and =

the composite core's cdev->lock.

Use of the UDC's private lock in 1 seems unavoidable.  Perhaps it can =

be avoided in 2, but wouldn't that leave us open to a race between =

reset handling and gadget driver unregistration?  In fact, that was the =

very reason for creating the commit cited at the top of this bug =

report.

I don't know enough of the details of the composite core to say whether =

its lock usage can be reduced.

Do you have any suggestions?

Alan Stern


--===============2685726271170843284==--

