Content-Type: multipart/mixed; boundary="===============3235313489116913747=="
MIME-Version: 1.0
From: Bjorn Helgaas <bhelgaas@google.com>
To: lkp@lists.01.org
Subject: Re: [PCI/MSI] WARNING: CPU: 0 PID: 1 at drivers/pci/msi.c:1034 pci_enable_msi_range+0x2c1/0x2f0()
Date: Fri, 03 Oct 2014 08:24:50 -0600
Message-ID: <CAErSpo5ha38Kq=AMJrFiKjoZGkLkAX2vccm4N9ftH4LkifB9_A@mail.gmail.com>
In-Reply-To: <20141003141548.GG8971@agordeev.usersys.redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3235313489116913747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2014 at 8:15 AM, Alexander Gordeev <agordeev@redhat.com> w=
rote:
> On Fri, Oct 03, 2014 at 09:25:22PM +0800, Fengguang Wu wrote:
>> Hi Alexander,
>>
>> FYI, we noticed the below changes on
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git pci/msi
>> commit 4ab2ee7c77875669230a797a3ed2228990f82545 ("PCI/MSI: Rename pci_ms=
i_check_device() to pci_msi_supported()")
>
> This commit was fixed and rebased and has different hash now:
>
> a06cd74cefe754341f747ddc4cf7b0058fa9bff8

Yep, I think this problem has been fixed already.

Bjorn

--===============3235313489116913747==--

