Content-Type: multipart/mixed; boundary="===============0615922912762337341=="
MIME-Version: 1.0
From: zhengbin (A) <zhengbin13@huawei.com>
To: lkp@lists.01.org
Subject: Re: 266a9a8b41: WARNING:possible_recursive_locking_detected
Date: Thu, 19 Sep 2019 11:36:28 +0800
Message-ID: <c79495de-9f51-4e9b-97e1-0f98a147cd8a@huawei.com>
In-Reply-To: <20190917120117.GG1131@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============0615922912762337341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 2019/9/17 20:01, Al Viro wrote:
> On Tue, Sep 17, 2019 at 03:03:33PM +0800, zhengbin (A) wrote:
>> On 2019/9/17 1:16, Al Viro wrote:
>>> On Sun, Sep 15, 2019 at 08:44:05PM -0700, Linus Torvalds wrote:
>>>> On Sun, Sep 15, 2019 at 8:04 PM Al Viro <viro@zeniv.linux.org.uk> wr=
ote:
>>>>> Perhaps lockref_get_nested(struct lockref *lockref, unsigned int subc=
lass)?
>>>>> With s/spin_lock/spin_lock_nested/ in the body...
>>>> Sure. Under the usual CONFIG_DEBUG_LOCK_ALLOC, with the non-debug case
>>>> just turning into a regular lockref_get().
>>>>
>>>> Sounds fine to me.
>>> Done and force-pushed into vfs.git#fixes
>> + if (file->f_pos > 2) {
>> + p =3D scan_positives(cursor, &dentry->d_subdirs,
>> + file->f_pos - 2, &to);
>> + spin_lock(&dentry->d_lock);
>> + list_move(&cursor->d_child, p);
>> + spin_unlock(&dentry->d_lock);
>> + } else {
>> + spin_lock(&dentry->d_lock);
>> + list_del_init(&cursor->d_child);
>> + spin_unlock(&dentry->d_lock);
>> }
>> +
>> + dput(to);
>> dput(to) should be in if if (file->f_pos > 2)? cause we dget(to) in scan=
_positives
> dput(NULL) is a no-op

+=C2=A0=C2=A0=C2=A0 spin_unlock(&dentry->d_lock);
+=C2=A0=C2=A0=C2=A0 dput(*res);
+=C2=A0=C2=A0=C2=A0 *res =3D found;
+=C2=A0=C2=A0=C2=A0 return p;

dput(*res) should be removed?

>
> .
>


--===============0615922912762337341==--

