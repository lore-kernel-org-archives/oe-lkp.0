Content-Type: multipart/mixed; boundary="===============6548488217052623819=="
MIME-Version: 1.0
From: Michael S. Tsirkin <mst@redhat.com>
To: lkp@lists.01.org
Subject: Re: [pci] 38ada4d7c6b: general protection fault: 0000 [#1] SMP
Date: Wed, 18 Mar 2015 08:21:07 +0100
Message-ID: <20150318081204-mutt-send-email-mst@redhat.com>
In-Reply-To: <1426553156.1126.11.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6548488217052623819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2015 at 08:45:56AM +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vhost-next
> commit 38ada4d7c6b416b2c41e67b721ebcfeec89e4751 ("pci: disable msi/msix a=
t probe time")
> =

> =

> +------------------------------------------+------------+------------+
> |                                          | 91435d5741 | 38ada4d7c6 |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 30         | 0          |
> | early-boot-hang                          | 1          |            |
> | boot_failures                            | 0          | 29         |
> | BUG:unable_to_handle_kernel              | 0          | 9          |
> | Oops                                     | 0          | 9          |
> | RIP:pci_bus_read_config_word             | 0          | 29         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 29         |
> | backtrace:__pci_register_driver          | 0          | 29         |
> | backtrace:piix_init                      | 0          | 9          |
> | backtrace:kernel_init_freeable           | 0          | 29         |
> | general_protection_fault                 | 0          | 20         |
> | backtrace:virtio_pci_driver_init         | 0          | 20         |
> +------------------------------------------+------------+------------+

Thanks a lot for the report!
This was a result of pushing a bad commit out, I have since
found and fixed this.
Just to clarify, you are testing all public heads?
Or does head need to confirm to some naming scheme?

Also, it seems you are testing in a KVM based VM, is that right?
If so, including the kvm userspace (QEMU?) version and command line
used could be benefitial in case people want to re-run the test.

Thanks!

> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
> =



--===============6548488217052623819==--

