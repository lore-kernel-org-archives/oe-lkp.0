Content-Type: multipart/mixed; boundary="===============9200517013540824885=="
MIME-Version: 1.0
From: Joerg Roedel <jroedel@suse.de>
To: lkp@lists.01.org
Subject: Re: 30514effc9 ("x86/mm/pti: Don't clear permissions in .."): WARNING: CPU: 0 PID: 1 at arch/x86/mm/dump_pagetables.c:283 note_page
Date: Wed, 08 Aug 2018 11:46:59 +0200
Message-ID: <20180808094659.rcnxq32v3p2mdrwt@suse.de>
In-Reply-To: <5b6ab75d.0adGiApE+ajF886e%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9200517013540824885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for the report!

On Wed, Aug 08, 2018 at 05:26:53PM +0800, kernel test robot wrote:
> [   16.937839] Freeing unused kernel image memory: 556K
> [   16.954368] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [   16.956696] x86/mm: Checking user space page tables
> [   16.973108] ------------[ cut here ]------------
> [   16.975052] x86/mm: Found insecure W+X mapping at address (____ptrval_=
___)/native_usergs_sysret64+0x0/0x10
> [   16.978787] WARNING: CPU: 0 PID: 1 at arch/x86/mm/dump_pagetables.c:28=
3 note_page+0xdd/0x890

I think this is caused by debug_checkrwx() running before
pti_finalize(). The check runs on the user page-tables before they are
finished. I prepare a patch to move the check for the user page-table to
pti_finilize() after the page-tables are updated. That should fix the
warning.


Thanks,

	Joerg

--===============9200517013540824885==--

