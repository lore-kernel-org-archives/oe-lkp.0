Content-Type: multipart/mixed; boundary="===============2738331290582070766=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/mm/ASLR] f47233c2d34: WARNING: CPU: 0 PID: 1 at arch/x86/mm/ioremap.c:63 __ioremap_check_ram+0x445/0x4a0()
Date: Sat, 28 Feb 2015 20:52:24 +0100
Message-ID: <20150228195224.GC11038@pd.tnic>
In-Reply-To: <20150228192009.GA2727@codeblueprint.co.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============2738331290582070766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2015 at 07:20:09PM +0000, Matt Fleming wrote:
> Doing a static allocation is fine, and the memory is even reserved from
> being overwritten via memblock_x86_reserve_range_setup_data(), but it

First of all, the naming of that function has failed really badly
somewhere along the way.

But more importantly, parse_setup_data() runs before it and the memory
is already overwritten even at parse_setup_data() time according to my
observations. So I think the more robust way is to stick setup_data
stuff below the minimum address decompress_kernel() works on... Where is
hpa when you need him? :-)

And this, dear children, is the bigger problem...

> looks like that reservation gets dropped before
> get_setup_data_total_num() runs, which is what is causing ioremap() to
> complain - it really is usable RAM we're trying to ioremap().

... while this is the easier problem which we can take care of by doing
monkey business like zapping the entry from the setup_data linked list
so that future examiners don't even get to see it:

---
@@ -460,9 +468,34 @@ static void __init parse_setup_data(void)
                case SETUP_KASLR:
                        parse_kaslr_setup(pa_data, data_len);
                        break;
+
+
+                       /*
+                        * Zap this element from the list so that nothing s=
ees
+                        * it later on.
+                        */
+                       if (!pa_prev) {
+                               boot_params.hdr.setup_data =3D pa_next;
+                       } else if (pa_next)
+                               struct setup_data *p;
+
+                               p =3D early_memremap(pa_prev, sizeof(*p));
+                               p->next =3D pa_next;
+                               early_iounmap(p, sizeof(*p));
+                       }
+
+                       pa_data =3D pa_next;
+                       continue;
+                       break;
                default:
+                       WARN_ON(1);
                        break;
                }
+               pa_prev =3D pa_data;
                pa_data =3D pa_next;
        }
 }

> Dropping the reservation looks to happen in memblock_x86_fill(), because
> you'll note that we explicitly reserve the boot services regions
> immediately after memblock_x86_fill() in setup_arch().

Well, this is not actually needed since parse_setup_data() runs much
earlier and we're perfectly fine with keeping that region until it gets
parsed there and freeing it afterwards because we don't need it.

Which reminds me that if we do that, we'll have to edit the setup_data
list which would actually make the zapping mandatory...

Yep, exactly: so I probably should add the above hunk to the final patch
too - we only need that entry until parse_setup_data() so that we can
fish out kaslr enabled state and after that we can free it.

> What isn't clear right now is why the ioremap() warning isn't triggering
> for a bunch of other callsites that get this wrong, i.e.
> pcibios_add_device().

That's a good question.

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--

--===============2738331290582070766==--

