Content-Type: multipart/mixed; boundary="===============1258029420942729119=="
MIME-Version: 1.0
From: Josef Bacik <jbacik@fb.com>
To: lkp@lists.01.org
Subject: Re: [nfsd] b44061d0b9: BUG: Dentry ffff880027d7c540{i=1846f, n=0a} still in use (1) [unmount of btrfs vda]
Date: Wed, 10 Aug 2016 14:32:47 -0400
Message-ID: <b7111dc6-a077-0100-1f99-2af09f126f73@fb.com>
In-Reply-To: <CA+55aFzdTMBc7f5=bQLRUtceu-Kg-MGmzWrAv1r96_ra8yutJA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1258029420942729119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/10/2016 02:25 PM, Linus Torvalds wrote:
> On Wed, Aug 10, 2016 at 11:22 AM, Josef Bacik <jbacik@fb.com> wrote:
>> On 08/10/2016 02:06 PM, Linus Torvalds wrote:
>>>
>>> More information in the original email on lkml.
>>
>> I'm not subscribed to lkml and for some reason I can't find the original
>> email in any of the lkml/linux-nfs archives.  Could you forward more of =
the
>> details?
>
> Done.
>

Looks like an NFS problem.  Before in the !resfhp->fh_dentry case we would =
do a =

lookup_one_len() and carry on.  Now we do the lookup_one_len(), call into =

nfsd_create_locked() and do a dget on resfhp->f_dentry, which from looks of=
 it =

is the dentry we just did a lookup_one_len() on, so we have one more ref on=
 the =

dentry than we did previously.  Thanks,

Josef


--===============1258029420942729119==--

