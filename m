Content-Type: multipart/mixed; boundary="===============0753914544306289069=="
MIME-Version: 1.0
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v4] Introduce v3 namespaced file capabilities
Date: Tue, 13 Jun 2017 16:58:37 -0400
Message-ID: <36d9bc87-219c-5964-8229-41de7941889f@linux.vnet.ibm.com>
In-Reply-To: <20170613205312.gre2s6a3zsrjnyos@smitten>
List-Id: <oe-lkp.lists.linux.dev>

--===============0753914544306289069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/13/2017 04:53 PM, Tycho Andersen wrote:
> On Tue, Jun 13, 2017 at 04:49:03PM -0400, Stefan Berger wrote:
>> On 06/13/2017 04:46 PM, Tycho Andersen wrote:
>>> On Tue, Jun 13, 2017 at 10:45:02AM -0700, James Bottomley wrote:
>>>> On Tue, 2017-06-13 at 11:14 -0600, Tycho Andersen via Containers wrote:
>>>>> Hi Stefan,
>>>>>
>>>>> On Tue, Jun 13, 2017 at 11:47:26AM -0400, Stefan Berger wrote:
>>>>>> On 05/08/2017 02:11 PM, Serge E. Hallyn wrote:
>>>>>>> Root in a non-initial user ns cannot be trusted to write a
>>>>>>> traditional security.capability xattr.  If it were allowed to do
>>>>>>> so, then any unprivileged user on the host could map his own uid
>>>>>>> to root in a private namespace, write the xattr, and execute the
>>>>>>> file with privilege on the host.
>>>>>>>
>>>>>>> However supporting file capabilities in a user namespace is very
>>>>>>> desirable.  Not doing so means that any programs designed to run
>>>>>>> with limited privilege must continue to support other methods of
>>>>>>> gaining and dropping privilege.  For instance a program installer
>>>>>>> must detect whether file capabilities can be assigned, and assign
>>>>>>> them if so but set setuid-root otherwise.  The program in turn
>>>>>>> must know how to drop partial capabilities, and do so only if
>>>>>>> setuid-root.
>>>>>> Hi Serge,
>>>>>>
>>>>>>
>>>>>>     I have been looking at patch below primarily to learn how we
>>>>>> could apply a similar technique to security.ima and security.evm
>>>>>> for a namespaced IMA. From the paragraphs above I thought that you
>>>>>> solved the problem of a shared filesystem where one now can write
>>>>>> different security.capability xattrs by effectively supporting for
>>>>>> example security.capability[uid=3D1000] and
>>>>>> security.capability[uid=3D2000] written into the filesystem. Each
>>>>>> would then become visible as security.capability if the userns
>>>>>> mapping is set appropriately.
>>>>> One disadvantage of this approach is that whoever is setting up the
>>>>> container would need to go touch the security.ima attribute for each
>>>>> file in the contianer, which would slow down container creation time.
>>>>> For capabilities this makes sense, because you might want the file to
>>>>> have different capabilities in different namespaces, but for IMA,
>>>>> since the file hash will be the same in every namespace,
>>>> Actually, this isn't necessarily true: IMA may have the hash, you're
>>>> right, but I suspect in most container use cases it will have the
>>>> signature.  It's definitely a use case that the container will be using
>>>> a different keyring from the host, so different signatures are surely
>>>> possible for the same underlying image file.
>>>>
>>>> One might imagine doing the above via overlays, because the new
>>>> signature should override the old.
>>> Yes, good point, thanks. Assuming the container and the host are using
>>> the same keyring, we could design it in such a way that the container
>>> engine doesn't need to touch every file on creation, which would be
>>> very nice.
>> I don't think this will be the general case. The host may be Ubuntu, the
>> guest could be Fedora and you'll have different keys. I don't think you
>> would want the container keys on the host keyring.
> I guess it depends: if your entire infrastructure needs to be signed
> by your ops team, it would (presumably) all be the same ops key. If
> you're running off the shelf stuff from the distros or from a vendor,
> probably not, I agree.

I think this will largely depend on how IMA works with namespaces. In =

the prototype I mention we had each container have its own _ima keyring =

and the public keys were inside the container at the typical location =

(for physical machines) and the mgmt. stack (docker) basically emulating =

what the initramfs scripts are doing, which is loading all keys from =

/etc/keys/ima into that keyring.

    Stefan

> Cheers,
>
> Tycho
>


--===============0753914544306289069==--

