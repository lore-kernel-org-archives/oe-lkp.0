Content-Type: multipart/mixed; boundary="===============4191510608972666418=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Not being CC'd on reports for commits from my tree authored by somebody else
Date: Thu, 24 Mar 2022 11:13:49 +0100
Message-ID: <f332b0d6-a2fd-638e-f61e-a47b66043b9e@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============4191510608972666418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

LKP tests branches my kernel.org tree(s) but it seems if the commit is
authored by somebody else, I'm not CC'd directly, even though there's my
Signed-off-by and it's in my git tree.
Example:

https://lore.kernel.org/all/20220323090520.GG16885(a)xsang-OptiPlex-9020/

I would like to be CC'd in such cases. Can you perhaps just Cc additionally
based on Signed-off-by for everyone? Or if some other maintaners don't want
this, do it at least for my trees:

https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git
https://git.kernel.org/cgit/linux/kernel/git/vbabka/slab.git

Thanks a lot!
Vlastimil
--===============4191510608972666418==--

