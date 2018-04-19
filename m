Content-Type: multipart/mixed; boundary="===============7967251221074137557=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@intel.com>
To: lkp@lists.01.org
Subject: Re: BUG: Bad page map in process python2 pte:10000000000 pmd:17e8be067
Date: Thu, 19 Apr 2018 11:53:51 -0700
Message-ID: <17463682-dc08-358d-8b44-02821352604c@intel.com>
In-Reply-To: <20180419054047.xxiljmzaf2u7odc6@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7967251221074137557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/18/2018 10:40 PM, Fengguang Wu wrote:
> [  716.494065] PASS concurrent_autogo_5ghz_ht40 4.803608 2018-03-23 09:57=
:21.586794
> [  716.494069]
> [  716.496923] passed all 1 test case(s)
> [  716.496926]
> [  716.511702] swap_info_get: Bad swap file entry 04000000
> [  716.512731] BUG: Bad page map in process python2  pte:100_0000_0000 pm=
d:17e8be067
> [  716.513844] addr:00000000860ba23b vm_flags:00000070 anon_vma:         =
 (null) mapping:000000004c76fece index:1e2
> [  716.515160] file:libpcre.so.3.13.3 fault:filemap_fault mmap:generic_fi=
le_mmap readpage:simple_readpage
> [  716.516418] CPU: 2 PID: 8907 Comm: python2 Not tainted 4.16.0-rc5 #1
> [  716.517533] Hardware name:  /DH67GD, BIOS BLH6710H.86A.0132.2011.1007.=
1505 10/07/2011

Did you say that you have a few more examples of this?

I would be really interested if it's always python or always the same
shared library, or always file-backed memory, always the same bit,
etc...  From the vm_flags, I'd guess that this is the "rw-p" part of the
file mapping.

The bit that gets set is really weird.  It's bit 40.  I could definitely
see scenarios where we might set the dirty bit, or even NX for that
matter, or some *bit* that we mess with in software.  It's not even
close to the boundary where it could represent a swapoffset=3D1 or swapfile=
=3D1.

It's also unlikely to be _PAGE_PSE having gone missing from the PMD
since it's in the middle of a file-backed mapping and the PMD is
obviously pointing to a 4k page.

If I had to put money on it, I'd guess it's a hardware bit flip, or less
likely, a rogue software bit flip.  But, more examples will hopefully
shed some more light.


--===============7967251221074137557==--

