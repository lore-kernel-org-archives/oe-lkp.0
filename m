Content-Type: multipart/mixed; boundary="===============0977800341552493083=="
MIME-Version: 1.0
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Fri, 14 Jul 2017 11:22:28 -0400
Message-ID: <596f808b-e21d-8296-5fef-23c1ce7ab778@linux.vnet.ibm.com>
In-Reply-To: <20170714133437.GA16737@mail.hallyn.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0977800341552493083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/14/2017 09:34 AM, Serge E. Hallyn wrote:
> Quoting Stefan Berger (stefanb(a)linux.vnet.ibm.com):
>> On 07/13/2017 08:38 PM, Eric W. Biederman wrote:
>>> Stefan Berger <stefanb@linux.vnet.ibm.com> writes:
>>>
>>>> On 07/13/2017 01:49 PM, Eric W. Biederman wrote:
>>>>
>>>>> My big question right now is can you implement Ted's suggested
>>>>> restriction.  Only one security.foo or secuirty.foo(a)... attribute ?
>>>> We need to raw-list the xattrs and do the check before writing them. I=
 am fairly sure this can be done.
>>>>
>>>> So now you want to allow security.foo and one security.foo(a)uid=3D<> =
or just a single one security.foo(@[[:print:]]*)?
>>>>
>>> The latter.
>> That case would prevent a container user from overriding the xattr
>> on the host. Is that what we want? For limiting the number of xattrs
> Not really.  If the file is owned by a uid mapped into the container,
> then the container root can chown the file which will clear the file
> capability, after which he can set a new one.  If the file is not
> owned by a uid mapped into the container, then container root could
> not set a filecap anyway.

Let's say I installed a container where all files are signed and thus =

have security.ima. Now for some reason I want to re-sign some or all =

files inside that container. How would I do that ? Would I need to get =

rid of security.ima first, possibly by copying each file, deleting the =

original file, and renaming the copied file to the original name, or =

should I just be able to write out a new signature, thus creating =

security.ima(a)uid=3D1000 besides the security.ima ?

    Stefan


--===============0977800341552493083==--

